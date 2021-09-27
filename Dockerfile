FROM ubuntu:14.04
RUN apt-get update -y
RUN apt-get install openssh-server -y \
    openssh-client* -y \
    apache2 -y \
    unzip -y \
    vim -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page271/pure.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip pure.zip
RUN cp -rvf pure/* .
ENTRYPOINT /usr/sbin/apache2 -D FOREGROUND
CMD ["/bin/bash", "-D"]
EXPOSE 80
EXPOSE 22

