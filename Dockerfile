FROM alpine:3.12

ENV K8S_VERSION="v1.30.9"
ENV KUSTOMIZE_VERSION="v5.4.2"

RUN apk add --no-cache --update ca-certificates curl gettext \
  && curl -L https://dl.k8s.io/release/${K8S_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl \
  && curl -L https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz -o kustomize.tar.gz \
  && tar xzf kustomize.tar.gz \
  && rm -f kustomize.tar.gz \
  && mv kustomize /usr/local/bin/kustomize \
  && chmod +x /usr/local/bin/kustomize
