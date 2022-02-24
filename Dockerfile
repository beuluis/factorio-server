FROM factoriotools/factorio:stable

RUN apk add jq

COPY entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]