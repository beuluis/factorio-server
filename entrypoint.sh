#!/bin/bash
mkdir -p /factorio/config

envsubst </server-settings.json.tmpl >/factorio/config/server-settings.json

IFS=',' read -ra adminlist <<<"$ADMINLIST"
if [ ${#adminlist[@]} -gt 0 ]; then
    printf '%s\n' "${adminlist[@]}" | jq -R . | jq -s . > /factorio/config/server-adminlist.json
else
    echo "[]" > /factorio/config/server-adminlist.json
fi

IFS=',' read -ra whitelist <<<"$WHITELIST"
if [ ${#whitelist[@]} -gt 0 ]; then
    printf '%s\n' "${whitelist[@]}" | jq -R . | jq -s . > /factorio/config/server-whitelist.json
else
    echo "[]" > /factorio/config/server-whitelist.json
fi

exec /docker-entrypoint.sh
