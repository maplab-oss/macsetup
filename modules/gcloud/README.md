Installs the Google Cloud CLI using Google's official installer to `~/google-cloud-sdk/`.

## Initial Setup

```bash
gcloud init
```

## Common Commands

```bash
gcloud auth login                    # Authenticate
gcloud config set project PROJECT_ID # Set active project
gcloud compute instances list        # List compute instances
gcloud app deploy                    # Deploy to App Engine
gsutil ls gs://bucket-name           # List cloud storage files
gcloud components update             # Update CLI
```

