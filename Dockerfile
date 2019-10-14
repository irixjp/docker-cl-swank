FROM centos:8
MAINTAINER @irix_jp

RUN dnf update -y && \
    dnf install -y glibc-all-langpacks gcc make autoconf automake libcurl-devel zlib-devel git bzip2 which ncurses-devel && \
    git clone -b release https://github.com/roswell/roswell.git && \
    cd roswell  && \
    sh bootstrap && \
    ./configure && make && make install  && \
    ros setup

RUN dnf install -y openssh-server passwd && \
    /usr/bin/ssh-keygen -t rsa     -f /etc/ssh/ssh_host_rsa_key     -C '' -N '' && \
    /usr/bin/ssh-keygen -t ecdsa   -f /etc/ssh/ssh_host_ecdsa_key   -C '' -N '' && \
    /usr/bin/ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -C '' -N ''

COPY swank.ros /root
COPY inits.sh /root

EXPOSE 22
CMD ["bash", "/root/inits.sh"]
