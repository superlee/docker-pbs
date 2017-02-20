FROM centos:7

MAINTAINER Charles Li

ENV TORQUE_VERSION=5.1.2

RUN yum -y install libtool openssl-devel libxml2-devel boost-devel gcc gcc-c++ wget
RUN wget http://www.adaptivecomputing.com/index.php?wpfb_dl=3124 -O torque-${TORQUE_VERSION}.tar.gz
RUN tar -xf torque-${TORQUE_VERSION}.tar.gz && rm torque-${TORQUE_VERSION}.tar.gz
RUN yum -y group install "Development Tools"
RUN cd $(ls -d torque*)/ && \
    ./configure && \
    make && \
    make install

RUN yum -y install initscripts openssh openssh-server nfs-utils openldap-clients nss-pam-ldapd vim authconfig

RUN chmod u+x /init.sh

ENV PBS_HOME=/var/spool/torque

EXPOSE 15001
EXPOSE 22

CMD hostname -f > /var/spool/torque/server_name
CMD /usr/local/sbin/trqauthd &
CMD yes|$(ls -d torque*)/torque.setup root
CMD /usr/local/sbin/pbs_sched -d ${PBS_HOME}