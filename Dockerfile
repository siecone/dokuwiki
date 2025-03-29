FROM debian:bookworm-slim

RUN apt-get update -yq;\
    apt-get install wget php libapache2-mod-php php-xml php-json php-mbstring php-zip php-intl php-gd -yq;\
    a2enmod rewrite;\
    wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz;\
    apt-get purge wget;\
    rm -r /var/lib/apt/lists/*

RUN rm /var/www/html/* && mkdir -p /var/run/apache2

COPY entrypoint.sh /usr/local/bin/
COPY apache.conf /etc/apache2/sites-enabled/dokuwiki.conf

EXPOSE 80
CMD ["entrypoint.sh"]
