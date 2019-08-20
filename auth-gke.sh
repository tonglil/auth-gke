#!/bin/bash
set -euo pipefail

main() {
  _trace gcloud container clusters get-credentials "$CLUSTER" --project "$PROJECT" --zone "${LOCATION:-${ZONE:-}}"
  # Display after getting credentials because gcloud sets the version based on the cluster version
  _trace kubectl version
}

# Display the underlying command
_trace() {
  cmd=($@)
  echo "$ ${cmd[*]}"
  "${cmd[@]}"
}

auth-gcloud

main
