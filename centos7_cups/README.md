Build image:

**docker build -t \<username\>/centos7_cups .**

Start container:

**docker run --privileged -d -p 631:631 --name \<containername\> centos7_cups**
