FROM centos
MAINTAINER @irix_jp

# docker build --no-cache --rm -t irixjp/sbcl-swank:latest .
# docker run -d -p 4005:4005 irixjp/supervisord:latest --name hoge irixjp/supervisord

RUN yum update -y
RUN yum install -y epel-release
RUN yum install -y curl sbcl git supervisor

RUN cd /root && curl -O http://beta.quicklisp.org/quicklisp.lisp
ADD install-quicklisp.lisp /root
RUN cd /root && sbcl --script install-quicklisp.lisp

ADD swank-load.lisp /root
ADD supervisord.d/swank.ini /etc/supervisord.d

EXPOSE 4005
CMD supervisord -n
