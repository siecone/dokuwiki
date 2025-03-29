#!/bin/bash
set -e

# Apache gets grumpy about PID files pre-existing
rm -f /usr/local/apache2/logs/httpd.pid

# test if /var/www/html is empty
if [ -z "$( ls -A '/var/www/html' )" ]; then
	tar xzf /dokuwiki-stable.tgz -C /tmp
	mv /tmp/dokuwiki-*/* /var/www/html
	rm -rf /tmp/dokuwiki-*
fi

# set the owner
chown -R www-data:www-data /var/www/html/

# start apache with environment variables
source /etc/apache2/envvars
exec apache2 -f /etc/apache2/apache2.conf -DFOREGROUND "$@"
