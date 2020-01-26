FROM centos:latest

RUN yum update -y \
    && yum install -y epel-release \
    && yum install -y openvpn wget \
    && yum install -y openssl; 

RUN mkdir /etc/openvpn/ssl/; \
    mkdir /etc/openvpn/ssl1/; \
    openvpn --genkey --secret /etc/openvpn/ssl1/tls-crypt.key;\
    openssl dhparam -out /etc/openvpn/ssl1/dhparam.pem 2048; \
    chmod -R 600 /etc/openvpn/ssl/;\
    chmod 700 /etc/openvpn/ssl;\
    echo net.ipv4.ip_forward=1 > /etc/sysctl.d/ipforward.conf;

RUN yum install -y sudo;

    
