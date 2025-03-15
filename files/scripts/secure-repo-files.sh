#!/usr/bin/env bash

set -oue pipefail

echo "Securing the repo files against manipulation."
run0 sh -c "chown root:root /etc/yum.repos.d/* && \
                chmod 744 /etc/yum.repos.d/* && \
                chcon -R system_u:object_r:system_conf_t:s0 /etc/yum.repos.d/
            " || {
    echo "Failed to secure the repo files!"
    exit 1
}