# hub.docker.com/r/tiredofit/yourls

# Introduction

This will build a container for YOURLS, a URL Link shortener.


*    Downloads Latest Release upon initial bootup.



This image needs manual configuration to get configuration running, it is not fully dynamic specifically if you add plugins!. Please see invidividual plugin documentation and manually edit the www/yourls/user/config.php file for these additions.


This Container uses Alpine:3.8 as a base.
Additional components inside the image are: NginX, PHP7 w/APC, OPCache



[Changelog](CHANGELOG.md)

# Authors

- [Dave Conroy](dave at tiredofit dot ca)

# Table of Contents

- [Introduction](#introduction)
    - [Changelog](CHANGELOG.md)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Configuration](#configuration)
    - [Data Volumes](#data-volumes)
    - [Environment Variables](#environmentvariables)   
    - [Networking](#networking)
- [Maintenance](#maintenance)
    - [Shell Access](#shell-access)
   - [References](#references)

# Prerequisites

This container requires the use of an external MariaDB database container.


# Installation

Automated builds of the image are available on [Registry](https://hub.docker.com/r/tiredofit/yourls) and is the recommended method of installation.


```bash
docker pull hub.docker.com/r/tiredofit/yourls
```

# Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabiltiies of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.



# Configuration

### Data-Volumes

The following directories are used for configuration and can be mapped for persistent storage.

| Directory | Description |
|-----------|-------------|
| /www/logs | PHP and NginX Logs |
| /www/yourls | YOURLS Data and Configuration Files |

      

### Environment Variables

Below is the complete list of available options that can be used to customize your installation.

| Parameter | Description |
|-----------|-------------|
| `PHP_MEMORY_LIMIT` | PHP7 Script Execution Memory Limit (Default 128M) |
| `UPLOAD_MAX_SIZE` | NginX Maximum Upload Size (Default 2G) |
| `APC_SHM_SIZE` | PHP7 APC Cache Size (Default 128M) |
| `OPCACHE_MEM_SIZE` | PHP7 OPcache Memory Allocation (Default 128) |
| `TZ` | Timezone Definition for PHP (Default: America/Vancouver) |
| `DB_HOST` | External MariaDB Container (e.g. yourls-db) |
| `DB_NAME` | Database Name (e.g. yourls) |
| `DB_USER` | User with Database Permissions (e.g. yourls) |
| `DB_PASS` | Password for above user (e.g. userpassword) |
| `ADMIN_USER` | Administrative User (e.g. admin) |
| `ADMIN_PASS` | Password for Administrative User (e.g. password) |
| `DEBUG` | Set application to Debug Mode to Display Queries (Default: FALSE) |


### Networking

The following ports are exposed.

| Port      | Description |
|-----------|-------------|
| 80        | HTTP        |

# Maintenance
#### Shell Access

For debugging and maintenance purposes you may want access the containers shell. 

```bash
docker exec -it (whatever your container name is e.g. yourls) bash
```

# References

* https://yourls.org

