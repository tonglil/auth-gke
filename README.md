# auth-gke

Get the credentials for the GKE cluster using a GCP service account JSON credential.

## Usage

```sh
docker run \
  -e TOKEN="$(cat service-account.json)" \
  -e PROJECT=my-project \
  -e ZONE=us-central1-b \
  -e CLUSTER=my-cluster \
  tonglil/auth-gke
```
