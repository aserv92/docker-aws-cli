FROM chekote/alpine:3.20.2-2024-09-13-09-41-31

RUN set -eu pipefail && \
    apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests \
    groff \
    less \
    awscli && \
    apt-get remove -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /workdir

CMD ["aws"]
