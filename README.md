# auth-gke

Get the credentials for the GKE cluster using a GCP service account JSON credential.

Based on https://github.com/tonglil/auth-gcloud.

## Usage

```sh
docker run \
  -e TOKEN="$(cat service-account.json)" \
  -e PROJECT=my-project \
  -e LOCATION=us-central1-b \
  -e CLUSTER=my-cluster \
  tonglil/auth-gke
```

## Example

### Drone 1+

```yml
pipeline:
  gke-actions:
    image: tonglil/auth-gke
    environment:
      PROJECT: my-project
      LOCATION: us-central1-b # zone or region
      CLUSTER: my-cluster
    commands:
      - auth-gke
      - kubectl ...
    secrets: [google_credentials]
```

### Drone 0.5+

<details>
  <summary>Expand</summary>

```yml
steps:
- name: gke-actions
  image: tonglil/auth-gke
  environment:
    PROJECT: my-project
    LOCATION: us-central1-b # zone or region
    CLUSTER: my-cluster
    TOKEN:
      from_secret: google_credentials
  commands:
    - auth-gke
    - kubectl ...
```
</details>

## Releasing

Use the base image's `gcloud` version number as the tag:

```
make pull
make version
```

## Changelog

See release notes: https://github.com/tonglil/auth-gke/releases
