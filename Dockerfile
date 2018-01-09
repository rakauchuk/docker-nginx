FROM nginx:latest

MAINTAINER Kirill Rakauchuk "trw2NgYfmDxnZGu@gmail.com"

RUN rm -v /etc/nginx/nginx.conf

COPY sites-available/ /etc/nginx/sites-available
COPY sites-enabled/ /etc/nginx/sites-enabled
COPY directive-only/ /etc/nginx/directive-only
COPY location/ /etc/nginx/location
COPY basic.conf /etc/nginx/
COPY mime.types /etc/nginx/
COPY nginx.conf /etc/nginx/

RUN ln -s /etc/nginx/sites-available/no-default /etc/nginx/sites-enabled/no-default

RUN usermod -u 1000 www-data

WORKDIR /var/www/html

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80
EXPOSE 443
