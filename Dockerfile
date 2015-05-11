FROM ubuntu
#FROM silarsis/base
MAINTAINER Kevin Littlejohn <kevin@littlejohn.id.au>
ENV http_proxy=http://pc-64735.prod.lan:3128 https_proxy=http://pc-64735.prod.lan:3128

RUN apt-get -yq update

RUN apt-get -yq install squid iptables
ADD squid.conf /etc/squid3/squid.conf
ADD start_squid.sh /usr/local/bin/start_squid.sh

EXPOSE 3128

CMD ["/usr/local/bin/start_squid.sh"]
