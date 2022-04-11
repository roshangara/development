FROM alpine:3.15.2

COPY run.sh .

RUN sh run.sh

ENTRYPOINT /bin/zsh
