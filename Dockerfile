ARG PHP_BASE=8.3
ARG DISTRO="alpine"

FROM docker.io/tiredofit/nginx-php-fpm:${PHP_BASE}-${DISTRO}
LABEL maintainer="Dave Conroy (github.com/tiredofit)"
ENV YOURLS_VERSION=1.10.1 \

    PHP_ENABLE_CREATE_SAMPLE_PHP=FALSE \
    PHP_ENABLE_CURL=TRUE \
    PHP_ENABLE_LDAP=TRUE \
    PHP_ENABLE_MYSQLI=TRUE \
    NGINX_WEBROOT="/www/yourls" \
    NGINX_SITE_ENABLED="yourls" \
    IMAGE_NAME="tiredofit/yourls" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-yourls/"

### Dependency Installation
RUN source /assets/functions/00-container && \
    set -x && \
    package update && \
    package upgrade && \
    package install .yourls-run-deps \
                    openldap-clients \
                    sed \
                    && \
    \
    mkdir -p /assets/install && \
    curl -ssL https://github.com/YOURLS/YOURLS/archive/refs/tags/${YOURLS_VERSION}.tar.gz | tar xvfz - --strip 1 -C /assets/install/ && \
    package cleanup

COPY install/ /
