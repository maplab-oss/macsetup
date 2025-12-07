#!/bin/bash

CMD="${1:-start}"
TARGET="${2:-all}"
CONFIG="proc.yaml"
NAMESPACE=$(yq eval '.namespace' "$CONFIG")
if [[ -z "$NAMESPACE" || "$NAMESPACE" == "null" ]]; then
  echo "Error: namespace not found in $CONFIG"
  echo "Add 'namespace: your-namespace' to the config file"
  exit 1
fi

[[ "$CMD" == "stop" ]] && CMD="delete"

# get namespaced process names
get_namespaced_processes() {
  pm2 jlist | jq -r ".[].name" | grep "^$NAMESPACE:" || true
}

# get process names from config
get_config_processes() {
  yq eval '.processes[].name' "$CONFIG"
}

# get process directory
get_process_dir() {
  local service_name="$1"
  yq eval ".processes[] | select(.name == \"$service_name\") | .dir" "$CONFIG"
}

# get process script
get_process_script() {
  local service_name="$1"
  yq eval ".processes[] | select(.name == \"$service_name\") | .script" "$CONFIG"
}

case "$CMD" in
  logs)
    if [[ "$TARGET" == "all" ]]; then
      PROCESSES=$(get_namespaced_processes)
      if [[ -z "$PROCESSES" ]]; then
        echo "No processes found with namespace: $PM2_NAMESPACE"
        exit 1
      fi
      pm2 logs --raw | grep -E "(^($NAMESPACE:[^|]+)\||\[$NAMESPACE:)"
    else
      pm2 logs "$NAMESPACE:$TARGET"
    fi
    ;;
  status)
    PROCESSES=$(get_namespaced_processes)
    if [[ -n "$PROCESSES" ]]; then
      pm2 list | head -n 2  # Show header
      pm2 list | grep "$NAMESPACE:" || echo "No running processes for namespace: $NAMESPACE"
    else
      echo "No processes found with namespace: $NAMESPACE"
    fi
    ;;
  start)
    if [[ "$TARGET" == "all" ]]; then
      while IFS= read -r service; do
        SCRIPT=$(get_process_script "$service")
        DIR=$(get_process_dir "$service")
        echo "starting service $service in namespace $NAMESPACE in dir $DIR"
        pm2 start "$SCRIPT" --name "$NAMESPACE:$service" --cwd "$DIR" --no-autorestart --silent
      done < <(get_config_processes)
    else
      if get_config_processes | grep -q "^$TARGET$"; then
        SCRIPT=$(get_process_script "$TARGET")
        DIR=$(get_process_dir "$TARGET")
        echo "starting service $TARGET in namespace $NAMESPACE in dir $DIR"
        pm2 start "$SCRIPT" --name "$NAMESPACE:$TARGET" --cwd "$DIR" --no-autorestart --silent
      else
        echo "Service '$TARGET' not found in config"
        exit 1
      fi
    fi
    ;;
  restart)
    if [[ "$TARGET" == "all" ]]; then
      PROCESSES=$(get_namespaced_processes)
      if [[ -n "$PROCESSES" ]]; then
        echo "$PROCESSES" | xargs -I {} pm2 restart "{}"
      else
        echo "No running processes for namespace: $NAMESPACE"
        exit 1
      fi
    else
      pm2 restart "$NAMESPACE:$TARGET"
    fi
    ;;
  delete)
    if [[ "$TARGET" == "all" ]]; then
      PROCESSES=$(get_namespaced_processes)
      if [[ -n "$PROCESSES" ]]; then
        echo "$PROCESSES" | xargs -I {} pm2 delete "{}" --silent
      else
        echo "No running processes for namespace: $NAMESPACE"
      fi
    else
      pm2 delete "$NAMESPACE:$TARGET" --silent
    fi
    ;;
  *)
    echo "Unsupported command: $CMD"
    echo "Usage: $0 [start|restart|stop|logs|status] [target]"
    echo "Namespace is read from the 'namespace' field in $CONFIG"
    exit 1
    ;;
esac
