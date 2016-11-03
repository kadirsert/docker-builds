FROM centos:7.2.1511
MAINTAINER Kadir Sert

VOLUME ["/var/spool/cups", "/var/log/cups"]

RUN yum -y install \
    cups \
    ghostscript.x86_64 \
 && yum clean all && systemctl enable cups.service

RUN rpm -qa |grep cups > /var/log/cups/rpmout

ADD config.sh /config.sh
RUN chmod 755 /config.sh
RUN /config.sh

EXPOSE 631


CMD [ "/sbin/init" ]