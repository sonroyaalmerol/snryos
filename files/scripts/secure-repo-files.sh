#!/usr/bin/env bash

set -oue pipefail

chown root:root /etc/yum.repos.d/*
chmod 744 /etc/yum.repos.d/*
chcon -R system_u:object_r:system_conf_t:s0 /etc/yum.repos.d/