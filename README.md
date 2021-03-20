# hub.docker.com/r/tiredofit/yourls

## Introduction

This will build a container for YOURLS, a URL Link shortener.

This image needs manual configuration to get configuration running, it is not fully dynamic specifically if you add plugins!. Please see invidividual plugin documentation and manually edit the `data/config` file for these additions.

This Container uses Alpine:3.13 as a base.

[Changelog](CHANGELOG.md)

## Authors

- [Dave Conroy](dave at tiredofit dot ca)

## Table of Contents

- [Introduction](#introduction)
- [Authors](#authors)
- [Table of Contents](#table-of-contents)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [Quick Start](#quick-start)
- [Configuration](#configuration)
  - [Data-Volumes](#data-volumes)
  - [Environment Variables](#environment-variables)
  - [Networking](#networking)
- [Maintenance](#maintenance)
  - [Shell Access](#shell-access)
- [References](#references)

## Prerequisites

This container requires the use of an external MariaDB database container.


## Installation

Automated builds of the image are available on [Docker Hub](https://hub.docker.com/r/tiredofit/yourls) and is the recommended method of installation.


```bash
docker pull hub.docker.com/r/tiredofit/yourls
```

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabiltiies of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.



## Configuration

### Data-Volumes

The following directories are used for configuration and can be mapped for persistent storage.

| Directory | Description                    |
| --------- | ------------------------------ |
| /www/logs | PHP and NginX Logs             |
| /data/    | Plugins and Configuration Data |



### Environment Variables

Below is the complete list of available options that can be used to customize your installation.

| Parameter    | Description                                      | Default |
| ------------ | ------------------------------------------------ | ------- |
| `DB_HOST`    | External MariaDB Container (e.g. yourls-db)      |         |
| `DB_NAME`    | Database Name (e.g. yourls)                      |         |
| `DB_USER`    | User with Database Permissions (e.g. yourls)     |         |
| `DB_PASS`    | Password for above user (e.g. userpassword)      |         |
| `ADMIN_USER` | Administrative User (e.g. admin)                 |         |
| `ADMIN_PASS` | Password for Administrative User (e.g. password) |         |
| `SITE_NAME`  | Site Name                                        |         |
| `SITE_URL`   | Site URL                                         |         |
| `DEBUG`      | Set application to Debug Mode to Display Queries | `FALSE` |


### Networking

The following ports are exposed.

| Port | Description |
| ---- | ----------- |
| 80   | HTTP        |

## Maintenance
### Shell Access

For debugging and maintenance purposes you may want access the containers shell.

```bash
docker exec -it (whatever your container name is e.g. yourls) bash
```

## References

* https://yourls.org

