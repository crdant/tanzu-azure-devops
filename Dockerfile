FROM node:10-alpine
RUN apk update && apk add bash sudo shadow curl && rm -rf /var/cache/apk/*

COPY --from=bitnami/kubectl /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/kubectl
COPY --from=mikefarah/yq /usr/bin/yq /usr/local/bin/yq

RUN curl -fL --output /usr/local/bin/tmc http://vmware.bintray.com/tmc/0.1.0-ff5a141c/linux/x64/tmc && \
  chmod 755 /usr/local/bin/tmc 

RUN curl -fL --output /tmp/velero.tar.gz https://github.com/vmware-tanzu/velero/releases/download/v1.4.2/velero-v1.4.2-linux-amd64.tar.gz && \
  tar -xzf /tmp/velero.tar.gz -C /usr/local/bin --strip-components=1 velero-v1.4.2-linux-amd64/velero

COPY --from=stedolan/jq /usr/local/bin/jq /usr/local/bin/jq

LABEL "com.azure.dev.pipelines.agent.handler.node.path"="/usr/local/bin/node"
CMD [ "node" ]
