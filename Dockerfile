FROM factoriotools/factorio:2.0.32

COPY entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]