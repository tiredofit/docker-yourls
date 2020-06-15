FROM tiredofit/nginx-php-fpm:7.0
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

ENV PHP_ENABLE_LDAP=TRUE \
    PHP_ENABLE_CREATE_SAMPLE_PHP=FALSE \
    PHP_ENABLE_MYSQLI=TRUE \
    NGINX_WEBROOT="/www/yourls" \
    ZABBIX_HOSTNAME=yourls-app

### Dependency Installation
RUN set -x && \
    apk update && \
    apk add -t .yourls-run-deps \
		       git \
		       openldap \
		       && \
    rm -rf /var/cache/apk/*

ADD install/ /
