FROM ubuntu:18.04
MAINTAINER huyd

# 安装软件包
RUN apt update \
    && apt install -y vim openssl openssh-server openssh-client \
    && apt install -y iptables net-tools screen sudo \
    && apt clean && rm -rf /var/lib/apt/lists/* 

RUN sed -ri 's/^#PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config \
    && echo 'root:passw0rd@' | chpasswd \
    && update-rc.d ssh enable

EXPOSE 22
CMD ["/sbin/init"]
