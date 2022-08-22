FROM alpine:3.16.2

ENV ANSIBLE_VERSION 2.13.2

RUN set -x && \
    apk --update add --virtual build-dependencies \
    gcc musl-dev libffi-dev openssl-dev python3-dev && \
    apk update && apk upgrade && \
    apk add --no-cache bash curl tar openssh-client sshpass git python3 py-pip py-yaml ca-certificates && \
    pip install --upgrade pip && \
    pip install wheel python-keyczar docker-py && \
    pip install ansible && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /etc/ansible /ansible

WORKDIR /ansible

# ENTRYPOINT ["ansible-playbook"]

