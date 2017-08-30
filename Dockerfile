# kubectl 1.7.4
FROM google/cloud-sdk:169.0.0-alpine

RUN gcloud components install kubectl

ENV CLOUDSDK_CONTAINER_USE_APPLICATION_DEFAULT_CREDENTIALS=false

COPY auth-gke.sh /bin/auth-gke

ENTRYPOINT ["/bin/auth-gke"]
