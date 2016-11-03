FROM centos7.2.1511
MAINTAINER Kadir Sert

RUN yum install -y \
    cups \
    ghostscript.x86_64 \
 && yum clean all \
 && systemctl enable cupsd.service

CMD ["/usr/sbin/init"]