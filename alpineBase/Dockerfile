FROM alpine:3

RUN set -ex \
    && sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories \
    && apk update && apk upgrade \
    && apk add git nodejs yarn zsh

CMD ["/bin/sh"]
