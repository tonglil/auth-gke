# auth-gke

Get the credentials for the GKE cluster using a GCP service account JSON credential.

Based on https://github.com/tonglil/auth-gcloud.

## Usage

```sh
docker run \
  -e TOKEN="$(cat service-account.json)" \
  -e PROJECT=my-project \
  -e ZONE=us-central1-b \
  -e CLUSTER=my-cluster \
  tonglil/auth-gke
```

## Example

Drone 0.5+:

```yml
pipeline:
  image: tonglil/auth-gke
  environment:
    PROJECT: my-project
    ZONE: us-central1-b
    CLUSTER: my-cluster
  commands:
    - auth-gke
    - kubectl ...
  secret: [google_credentials]
```
