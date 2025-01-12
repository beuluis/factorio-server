#!/bin/bash
mkdir -p /factorio/config

envsubst </server-settings.json.tmpl >/factorio/config/server-settings.json

IFS=',' read -ra adminlist <<<"$ADMINLIST"
if [ ${#adminlist[@]} -gt 0 ]; then
    printf '%s\n' "${adminlist[@]}" | jq --raw-input . | jq --slurp . >/factorio/config/server-adminlist.json
else
    echo "[]" >/factorio/config/server-adminlist.json
fi

IFS=',' read -ra whitelist <<<"$WHITELIST"
if [ ${#whitelist[@]} -gt 0 ]; then
    printf '%s\n' "${whitelist[@]}" | jq --raw-input . | jq --slurp . >/factorio/config/server-whitelist.json
else
    echo "[]" >/factorio/config/server-whitelist.json
fi

IFS=',' read -ra banlist <<<"$BANLIST"
if [ ${#banlist[@]} -gt 0 ]; then
    printf '%s\n' "${banlist[@]}" | jq --raw-input . | jq --slurp . >/factorio/config/server-banlist.json
else
    echo "[]" >/factorio/config/server-banlist.json
fi

mkdir -p /factorio/mods
rm /factorio/mods/mod-list.json
find /factorio/mods -name "*.zip" -type f -delete

IFS=',' read -ra mod_list <<<"$MOD_LIST"
mod_list=("base" "${mod_list[@]}")
printf '%s\n' "${mod_list[@]}" | jq --raw-input '{ name: ., enabled: true }' | jq --slurp '{ mods: . }' >/factorio/mods/mod-list.json

export UPDATE_MODS_ON_START=true

exec /docker-entrypoint.sh
