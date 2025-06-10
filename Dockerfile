FROM nginx:alpine

RUN apk add --no-cache bash postgresql-client

COPY wait-for-db.sh /wait-for-db.sh
RUN chmod +x /wait-for-db.sh

COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY web/ /usr/share/nginx/html/

CMD ["sh", "/wait-for-db.sh"]