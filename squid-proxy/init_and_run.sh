#!/bin/sh

mkdir -p  /apps/squid/var/lib/
chown -R nobody:nogroup /apps/
sed -i -e "s/CRAWLERA_API_KEY/$CRAWLERA_API_KEY/g" /apps/squid.conf.intercept-cache
/apps/squid/libexec/security_file_certgen -c -s /apps/squid/var/lib/ssl_db -M 4MB
/apps/squid/sbin/squid -z -f /apps/squid.conf.intercept-cache
chown -R nobody:nogroup /apps/
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf