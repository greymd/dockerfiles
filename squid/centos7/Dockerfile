FROM centos:7
MAINTAINER greymd <greengregson@gmail.com>
RUN yum install -y squid

# Default port of squid
EXPOSE 3128

CMD ["/usr/sbin/squid","-N"]
