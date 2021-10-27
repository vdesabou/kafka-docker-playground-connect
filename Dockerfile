ARG TAG
ARG CP_CONNECT_IMAGE
ARG TAG_JDBC
ARG CONNECT_USER
FROM confluentinc/${CP_CONNECT_IMAGE}:${TAG}
ARG TAG
ARG TAG_BASE
ARG TAG_JDBC
ARG CONNECT_USER
USER root
RUN wget http://vault.centos.org/8.1.1911/BaseOS/x86_64/os/Packages/iproute-tc-4.18.0-15.el8.x86_64.rpm && rpm -i --nodeps --nosignature http://vault.centos.org/8.1.1911/BaseOS/x86_64/os/Packages/iproute-tc-4.18.0-15.el8.x86_64.rpm ; curl http://mirror.centos.org/centos/7/os/x86_64/Packages/tree-1.6.0-10.el7.x86_64.rpm -o tree-1.6.0-10.el7.x86_64.rpm && rpm -Uvh tree-1.6.0-10.el7.x86_64.rpm || true && exit 0
RUN curl http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/tcpdump-4.9.3-1.el8.x86_64.rpm -o tcpdump-4.9.3-1.el8.x86_64.rpm && rpm -Uvh tcpdump-4.9.3-1.el8.x86_64.rpm || true && exit 0
RUN yum -y install --disablerepo='Confluent*' bind-utils openssl unzip findutils net-tools nc jq which iptables libmnl krb5-workstation krb5-libs && yum clean all && rm -rf /var/cache/yum || true && exit 0
RUN apt-get update; apt-get -y install bind-utils openssl unzip findutils net-tools nc jq which iptables iproute tree && rm -rf /var/lib/apt/lists/* || true && exit 0
RUN wget https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.12.0/jmx_prometheus_javaagent-0.12.0.jar -P /usr/share/
RUN rm -rf /tmp/* \
    && rm -rf /etc/confluent-control-center /usr/bin/control-center-* /usr/share/doc/confluent-control-center /usr/share/java/confluent-control-center
RUN mkdir -p /usr/share/confluent-hub-components && chown -R ${CONNECT_USER}:${CONNECT_USER} /usr/share/confluent-hub-components /etc/kafka /etc/schema-registry
USER ${CONNECT_USER}
