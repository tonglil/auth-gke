#!/bin/bash
set -euo pipefail

main() {
  _trace gcloud container clusters get-credentials "$CLUSTER" --project "$PROJECT" --zone "${LOCATION:-$ZONE}"
}


# Display the underlying command
_trace() {
  cmd=($@)
  echo "$ ${cmd[*]}"
  "${cmd[@]}"
}

auth-gcloud

main
