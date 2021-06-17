FROM centos:7
MAINTAINER huyd

ARG ERLANG_VERSION
ENV ERLANG_VERSION=${ERLANG_VERSION:-24.0.2}

ARG RABBITMQ_VERSION
ENV RABBITMQ_VERSION=${RABBITMQ_VERSION:-3.8.17}

RUN yum install -y wget unzip tar
RUN rpm -Uvh https://github.com/rabbitmq/erlang-rpm/releases/download/v${ERLANG_VERSION}/erlang-${ERLANG_VERSION}-1.el8.x86_64.rpm
RUN rpm --import http://www.rabbitmq.com/rabbitmq-signing-key-public.asc

#RUN yum install -y erlang

RUN yum install -y https://github.com/rabbitmq/rabbitmq-server/releases/download/v${RABBITMQ_VERSION}/rabbitmq-server-${RABBITMQ_VERSION}-1.el8.noarch.rpm

RUN /usr/sbin/rabbitmq-plugins list <<<'y'
RUN /usr/sbin/rabbitmq-plugins enable --offline rabbitmq_mqtt rabbitmq_stomp rabbitmq_management  rabbitmq_management_agent rabbitmq_federation rabbitmq_federation_management <<<'y'

RUN echo "[{rabbit, [{loopback_users, []}]}]." >  /etc/rabbitmq/rabbitmq.config
RUN echo "ERLANGCOOKIE" > /var/lib/rabbitmq/.erlang.cookie
ADD startrabbitmq.sh /opt/rabbitmq/

RUN chmod u+rw /etc/rabbitmq/rabbitmq.config \
&& chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie \
&& chmod 400 /var/lib/rabbitmq/.erlang.cookie \
&& chmod a+x /opt/rabbitmq/startrabbitmq.sh

EXPOSE 5672
EXPOSE 15672
EXPOSE 25672
EXPOSE 4369
EXPOSE 1883
EXPOSE 8883
EXPOSE 9100
EXPOSE 9101
EXPOSE 9102
EXPOSE 9103
EXPOSE 9104
EXPOSE 9105

CMD /opt/rabbitmq/startrabbitmq.sh
