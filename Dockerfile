FROM alpine:3.15.2

RUN set -xe \
    && apk update && apk upgrade \
    && apk add --update --no-cache \
        libgcc libstdc++ krb5-libs libintl libssl1.1 lttng-ust userspace-rcu mandoc man-pages \
        bash zsh zsh-autosuggestions zsh-syntax-highlighting zsh-vcs \
        tzdata coreutils file openssl openssh-client \
        lsof procps psmisc strace ncdu htop \
        docker-cli docker-cli-compose \
        iputils net-tools bind-tools \
        less which grep sed tree jq \
        xz tar unzip zip zlib \
        ca-certificates \
        git git-flow \
        sudo shadow \
        wget curl \
        vim nano \
        gnupg gpg \
        rsync \
        wrk \
    && sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" \
    && { find /usr/local/lib -type f -print0 | xargs -0r strip --strip-all -p 2>/dev/null || true; } \
    && rm -rf /tmp/* /var/tmp/* /usr/local/lib/php/doc/* /var/cache/apk/* /var/log/lastlog /var/log/faillog \
    && rm -rf *.tgz *.tar *.zip

RUN set -xe \
    && echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc \
    && echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc \
    && echo 'export GPG_TTY=$(tty)' >> ~/.zshrc \
    && echo 'alias docker-compose='docker compose'' >> ~/.zshrc \
    && sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd

RUN apk update

ENTRYPOINT /bin/zsh
