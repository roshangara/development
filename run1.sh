#!/bin/ash

wget -P /tmp/ https://raw.github.com/microsoft/vscode-dev-containers/main/containers/alpine/.devcontainer/library-scripts/common-alpine.sh

ash /tmp/common-alpine.sh "true" "vscode" "1000" "1000"

apk add --update --no-cache \
        libgcc libstdc++ krb5-libs libintl libssl1.1 lttng-ust userspace-rcu \
        tzdata coreutils file openssl openssh-client \
        lsof procps psmisc strace ncdu htop \
        iputils net-tools bind-tools \
        less which grep sed tree jq \
        xz tar unzip zip zlib \
        ca-certificates \
        git git-flow \
        sudo shadow \
        wget curl \
        nano \
        gnupg gpg \
        rsync \
        wrk

{ find /usr/local/lib -type f -print0 | xargs -0r strip --strip-all -p 2>/dev/null || true; }

rm -rf /tmp/* /var/tmp/* /usr/local/lib/php/doc/* /var/cache/apk/* /var/log/lastlog /var/log/faillog

rm -rf *.tgz *.tar *.zip
