FROM ubuntu

RUN apt-get update -y
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y fpc
RUN apt-get install -y apache2
RUN a2enmod cgi
COPY ./httpd.conf  /etc/apache2/sites-enabled/000-default.conf
RUN service apache2 restart

ARG BUILD_TYPE=prod
ENV BUILD_TYPE=${BUILD_TYPE}

COPY . .
RUN bash ./build.sh
COPY /public /var/www/app/public

CMD /usr/sbin/apache2ctl -D FOREGROUND

EXPOSE 80