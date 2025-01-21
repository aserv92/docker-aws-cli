FROM chekote/alpine:3.20.2-2024-09-13-09-41-31

ARG AWS_CLI_VERSION=2.15.57-r0

RUN set -eux; \
    apk update; \
    apk upgrade; \
    apk add --no-cache aws-cli=${AWS_CLI_VERSION}; \
    rm -rf /var/cache/apk/*;

WORKDIR /workdir

CMD ["aws"]
