FROM nginx:alpine

COPY conf/default.conf /etc/nginx/conf.d/default.conf

COPY web/ /usr/share/nginx/html/

EXPOSE 80