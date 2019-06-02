FROM ubuntu as builder

RUN apt-get update -y
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y fpc
RUN apt-get install -y apache2

ARG BUILD_TYPE=prod
ENV BUILD_TYPE=${BUILD_TYPE}

COPY . /var/www/app
WORKDIR /var/www/app
RUN bash ./build.sh

FROM actilis/httpd-cgi

ENV HTTPD_ENABLE_CGI=true

COPY ./httpd.conf  /etc/httpd/conf.d/000-default.conf

COPY --from=builder /var/www/app /var/www/app