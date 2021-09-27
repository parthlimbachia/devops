FROM ubuntu:14.04
RUN apt-get update -y
RUN apt-get install openssh-server -y \
    openssh-client* -y \
    apache2 -y \
    unzip -y \
    vim -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page271/autowash.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip autowash.zip
RUN rm -rf autowash.zip
RUN cp -rvf car-wash-website-template/* .
ENTRYPOINT /usr/sbin/apache2ctl -D FOREGROUND
CMD /usr/sbin/sshd -D FOREGROUND
EXPOSE 80
EXPOSE 22
