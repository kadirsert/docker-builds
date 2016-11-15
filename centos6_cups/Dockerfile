FROM centos:6.8
MAINTAINER Kadir Sert

RUN yum -y install \
    cups \
    ghostscript.x86_64 \
 && yum clean all && chkconfig cups on

ADD config.sh /config.sh
RUN chmod 755 /config.sh
RUN /config.sh

EXPOSE 631
VOLUME ["/var/spool/cups", "/var/log/cups"]

CMD [ "/sbin/init" ]
