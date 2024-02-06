#!/bin/bash
set -e

if [ ! -f "/config/qBittorrent/config/qBittorrent.conf" ]; then
    mkdir -p /config/qBittorrent/config/
    cp /usr/local/qbittorrent/defaults/qBittorrent.conf /config/qBittorrent/config/qBittorrent.conf
fi

if ! id -u "downloader" >/dev/null 2>&1; then
    groupadd -g "$PGID" downloader
    useradd -u "$PUID" -g "$PGID" downloader
fi

chown -R downloader:downloader /config

if [ $# -eq 0 ]; then
    sudo -u downloader -g downloader qbittorrent-nox --webui-port="$WEBUIPORT" --profile=/config
else
    exec "$@"
fi
