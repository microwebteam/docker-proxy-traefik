FROM traefik:2.1

LABEL maintainer="Sergii Sadovyi <s.sadovyi@deepvision.team>"

COPY rootfs/ /

RUN \
    # Create file for ACME storage
    mkdir -p /etc/traefik/certs && \
    touch /etc/traefik/certs/acme.json && \
    chmod 0600 /etc/traefik/certs/acme.json
