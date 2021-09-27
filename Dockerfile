FROM centos:latest
RUN yum update -y
RUN yum install openssh-server -y \
    openssh-client* -y \
    httpd -y \
    unzip -y \
    vim -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page271/pure.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip pure.zip
RUN cp -rvf pure/* .
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
CMD ["/bin/bash", "-D"]
EXPOSE 80
EXPOSE 22

