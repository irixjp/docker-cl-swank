FROM centos
MAINTAINER @irix_jp

RUN yum install -y epel-release
RUN yum install -y curl sbcl
RUN curl -O http://beta.quicklisp.org/quicklisp.lisp
ADD install-quicklisp.lisp /
RUN sbcl --script install-quicklisp.lisp

ADD swank-load.lisp /
CMD sbcl --dynamic-space-size 4gb --script swank-load.lisp
