#!/usr/bin/env sh

exec podman-compose run --rm webdav htpasswd -bn nobody nobody > auth/webdav.htpasswd
