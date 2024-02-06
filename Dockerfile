FROM debian:bookworm

ENV DEBIAN_FRONTEND=nointeractive
ARG RELEASE_TAG=release-4.6.3.10
ARG ARCH=x86_64

ENV PUID=1000
ENV PGID=1000
ENV WEBUIPORT=8080

RUN apt-get update && apt-get install -y curl unzip tzdata sudo && apt-get clean
RUN curl -L https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/${RELEASE_TAG}/qbittorrent-enhanced-nox_${ARCH}-linux-musl_static.zip -o /tmp/qbittorrent-enhanced-nox.zip && \
    unzip /tmp/qbittorrent-enhanced-nox.zip -d /usr/bin &&\
    rm -f /tmp/qbittorrent-enhanced-nox.zip

COPY qBittorrent.conf /usr/local/qbittorrent/defaults/qBittorrent.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

VOLUME [ "/config","/downloads" ]

ENTRYPOINT [ "/docker-entrypoint.sh" ]