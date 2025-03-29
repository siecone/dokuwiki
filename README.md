# dokuwiki
## example of docker-compose.yml

```
services:
  wiki:
    image: siecone/dokuwiki:latest
    volumes:
      - ./dokuwiki:/var/www/html
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
    ports:
      - "80:80"
    restart: always
```
