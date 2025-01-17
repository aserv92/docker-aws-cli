FROM chekote/ubuntu:noble-2025-01-08

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
