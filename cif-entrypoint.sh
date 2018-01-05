#!/bin/bash

set -e

export CIF_RUNTIME_PATH=/var/lib/cif

source /etc/cif.env

# create cif tokens
if [ ! -f /etc/cif/cif.yml ]; then
    cif-store --token-create-admin --config-path /etc/cif/cif.yml
    cat /etc/cif/cif.yml
fi

if [ ! -f /etc/cif/cif-router.yml ]; then
    cif-store --token-create-hunter --config-path /etc/cif/cif-router.yml
    cat /etc/cif/cif-router.yml
fi

if [ ! -f /etc/cif/csirtg-smrt.yml ]; then
    cif-store --token-create-smrt --config-path /etc/cif/csirtg-smrt.yml
    cat /etc/cif/csirtg-smrt.yml
fi

chown -R cif:cif /var/lib/cif
chown -R cif:cif /etc/cif
chown -R cif:cif /var/log/cif

exec "$@"