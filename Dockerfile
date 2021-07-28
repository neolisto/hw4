FROM alpine:latest

#opening 80 port
EXPOSE 80

#installing apache2 inside container
RUN  apk update && apk upgrade && \
     apk add apache2 && \
     apk add apache2-proxy && \
     apk add apache2-ssl && \
     rm -rf /var/cache/apk/*

#copying web-server configs
COPY index.html /var/www/localhost/htdocs/index.html
COPY conf.d/* /etc/apache2/

#running server inside container
CMD  [ "/usr/sbin/httpd", "-D", "FOREGROUND"]

