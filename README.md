# qbittorrentee-docker

[![Check Update](https://github.com/KagurazakaNyaa/qbittorrentee-docker/actions/workflows/update.yml/badge.svg)](https://github.com/KagurazakaNyaa/qbittorrentee-docker/actions/workflows/update.yml)
[![Build Docker Image](https://github.com/KagurazakaNyaa/qbittorrentee-docker/actions/workflows/docker.yml/badge.svg)](https://github.com/KagurazakaNyaa/qbittorrentee-docker/actions/workflows/docker.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/kagurazakanyaa/qbittorrentee)
![Docker Stars](https://img.shields.io/docker/stars/kagurazakanyaa/qbittorrentee)
![Image Size](https://img.shields.io/docker/image-size/kagurazakanyaa/qbittorrentee/latest)

qBittorrent-Enhanced-Edition Docker container

## Environments

| Variable  | Describe                  | Default Values | Allowed Values |
|-----------|---------------------------|----------------|----------------|
| PUID      | UID to run qBittorrent.   | 1000           | 0-65534        |
| PGID      | GID to run qBittorrent.   | 1000           | 0-65534        |
| WEBUIPORT | WebUI listen port.        | 8080           | 1024-65535     |

## Volumes

|Path           |Describe                                       |
|---------------|-----------------------------------------------|
|`/config`      | Config store path.                            |
|`/downloads`   | Default download path, can change in webui.   |
