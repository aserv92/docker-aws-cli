FROM chekote/ubuntu:bionic-d

RUN apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests \
    groff \
    less \
    awscli && \
    apt-get remove -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD entrypoint.sh /opt/aws-docker/entrypoint.sh

WORKDIR /workdir

ENTRYPOINT ["/opt/aws-docker/entrypoint.sh"]
