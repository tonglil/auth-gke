FROM tonglil/auth-gcloud:544.0.0

ENV CLOUDSDK_CONTAINER_USE_APPLICATION_DEFAULT_CREDENTIALS=false

COPY auth-gke.sh /bin/auth-gke

ENTRYPOINT ["/bin/auth-gke"]
