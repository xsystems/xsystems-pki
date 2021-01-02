#!/bin/sh

usage() {
    echo "Usage: $0 (client|server|ca) PKI_DIR COMMON_NAME"
    exit 1
}

create_client() {
    easyrsa build-client-full "$1" nopass
}

create_server() {
    easyrsa build-server-full "$1" nopass
}

create_ca() {
    easyrsa init-pki
    EASYRSA_REQ_CN="$1" easyrsa --batch build-ca
}

X509_TYPE="$1"
export EASYRSA_PKI="$2"
COMMON_NAME="$3"

if [ -z "${X509_TYPE}" ] || [ -z "${EASYRSA_PKI}" ] || [ -z "${COMMON_NAME}" ] ; then
    usage
fi

case "${X509_TYPE}" in
    client) create_client "${COMMON_NAME}"  ;;
    server) create_server "${COMMON_NAME}"  ;;
    ca)     create_ca     "${COMMON_NAME}"  ;;
    *)      usage
esac
