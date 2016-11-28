FROM centos:7.2.1511
MAINTAINER Kadir Sert

RUN sed -i '/nodocs/d' /etc/yum.conf

RUN yum -y groupinstall "Print Server"
RUN yum -y install \
    ghostscript.x86_64 \
    hplip.x86_64 \
 && yum clean all && systemctl enable cups.service

ADD config.sh /config.sh
RUN chmod 755 /config.sh
RUN /config.sh

VOLUME ["/etc/cups", "/usr/share/cups", "/var/spool/cups", "/var/log/cups", "/var/cache/cups"]
EXPOSE 631


CMD [ "/sbin/init" ]