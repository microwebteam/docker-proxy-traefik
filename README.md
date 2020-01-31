# Traefik Proxy

## Versions

* `2.1` – Current version

## Usage

### Docker Compose

Run Docker Compose file on every Docker host

```
version: "3.7"

services:
  dockersocket:
    image: docker.pkg.github.com/deeepvision/docker-socket-proxy/socket-proxy:2.0
    restart: always
    userns_mode: host
    security_opt:
      - no-new-privileges:true
    networks:
      - socket
    container_name: proxy-docker-socket
    environment:
      CONTAINERS: "1"

  traefik:
    image: docker.pkg.github.com/deeepvision/docker-traefik-proxy/traefik-proxy:2.1
    restart: always
    ports:
      - 80:80
      - 443:443
    networks:
      - public
      - socket
    volumes:
      - certs:/etc/traefik/certs
    container_name: proxy-traefik
    environment:
      CF_DNS_API_TOKEN: {cloudflare_token}

volumes:
  certs: {}

networks:
  socket:
    driver: bridge
  public:
    driver: bridge
```

    docker-compose -f docker-compose.yml -p proxy up -d

New Docker network `proxy_public` will be created.
Add all public containers to this network

## Exposed ports

* 80 – http
* 443 – https
