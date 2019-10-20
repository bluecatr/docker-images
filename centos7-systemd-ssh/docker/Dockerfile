FROM bluecatr/centos7-systemd-ssh:7
MAINTAINER huyd

ENV container docker
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo \
    && yum install -y docker-ce docker-ce-cli containerd.io \
    && yum clean all && rm -rf /var/cache/yum/* \
    && systemctl enable docker

#yum install docker-ce-18.06.3 docker-ce-cli-18.06.3 containerd.io

#ADD docker-compose-Linux-x86_64 /usr/local/bin/docker-compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

RUN chmod +x /usr/local/bin/docker-compose \
    && ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
