FROM tiredofit/nginx-php-fpm:8.0
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

ENV YOURLS_VERSION=1.8.1 \
    PHP_ENABLE_CREATE_SAMPLE_PHP=FALSE \
    PHP_ENABLE_CURL=TRUE \
    PHP_ENABLE_LDAP=TRUE \
    PHP_ENABLE_MYSQLI=TRUE \
    NGINX_WEBROOT="/www/yourls" \
    ZABBIX_HOSTNAME=yourls-app

### Dependency Installation
RUN set -x && \
    apk update && \
    apk upgrade && \
    apk add -t .yourls-run-deps \
		            openldap-clients \
                    sed \
                    && \
    \
    mkdir -p /assets/install && \
    curl -ssL https://github.com/YOURLS/YOURLS/archive/refs/tags/${YOURLS_VERSION}.tar.gz | tar xvfz - --strip 1 -C /assets/install/ && \
    rm -rf /var/cache/apk/*

ADD install/ /
