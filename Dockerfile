FROM alpine:3.15.2

COPY scripts/development.sh .

RUN ash development.sh

ENTRYPOINT /bin/zsh
