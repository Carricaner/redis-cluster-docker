FROM redis:7.2

WORKDIR /data

COPY ./config.conf /data/
COPY ./init.sh /data/

CMD redis-server /data/config.conf