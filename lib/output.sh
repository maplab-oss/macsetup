#!/bin/zsh

OUTPUT_TAG="[macsetup]"

log() {
  echo "🔧 $OUTPUT_TAG $1"
}

success() {
  echo "✅ $OUTPUT_TAG $1"
}

error() {
  echo "⚠️ $OUTPUT_TAG $1"
}

note() {
  echo "🔧 $OUTPUT_TAG $1"
}
