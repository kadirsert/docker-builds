FROM centos:7.2.1511
MAINTAINER Kadir Sert

RUN yum -y install \
    httpd \
 && yum clean all && systemctl enable httpd.service

EXPOSE 80
CMD ["/sbin/init"]