FROM ubuntu:latest

# Set noninteractive mode
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends bash curl ca-certificates iproute2 xz-utils bzip2 sudo adduser \
    && rm -rf /var/lib/apt/lists/* && apt-get update && apt-get install -y init && apt-get clean all -y RUN apt-get update && apt-get install -y systemd

RUN adduser --disabled-password --home / container

USER container
ENV  USER container
ENV HOME /
WORKDIR /

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
