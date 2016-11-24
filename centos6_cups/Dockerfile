FROM centos:6.8
MAINTAINER Kadir Sert

RUN yum -y install \
    cups \
    ghostscript.x86_64 \
    hplip.x86_64 \
 && yum clean all && chkconfig cups on

ADD config.sh /config.sh
RUN chmod 755 /config.sh
RUN /config.sh

VOLUME ["/etc/cups", "/usr/share/cups", "/var/spool/cups", "/var/log/cups", "/var/cache/cups"]
EXPOSE 631


CMD [ "/sbin/init" ]
