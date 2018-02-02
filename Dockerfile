FROM alpine:edge
MAINTAINER Bteton Along <along008@gmail.com>

ENV LANG C.UTF-8
ENV EFB_DATA_PATH /data/
ENV HTTPS_PROXY ""

RUN apk add --update --no-cache ca-certificates

RUN set -ex \
    && apk add --no-cache --virtual .run-deps \
           ffmpeg \
           libmagic \
           python3 \
           py3-numpy \
           py3-pillow

RUN set -ex \
    && pip3 install pysocks ehforwarderbot efb-telegram-master efb-wechat-slave

CMD ["ehforwarderbot"]
