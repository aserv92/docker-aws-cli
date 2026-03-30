FROM chekote/alpine:3.23.3-2026-03-23-14-50-28

ARG AWS_CLI_VERSION=2.32.7-r0

RUN set -eux; \
    apk update; \
    apk upgrade; \
    apk add --no-cache aws-cli=${AWS_CLI_VERSION}; \
    rm -rf /var/cache/apk/*;

WORKDIR /workdir

CMD ["aws"]
