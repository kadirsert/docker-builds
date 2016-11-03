FROM centos:7.2.1511
MAINTAINER Kadir Sert

RUN yum -y install \
    cups \
    ghostscript.x86_64 \
 && yum clean all && systemctl enable cups.service

EXPOSE 631
VOLUME ["/var/spool/cups", "/var/log/cups"]

CMD [ "/sbin/init" ]