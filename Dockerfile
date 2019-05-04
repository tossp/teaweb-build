FROM alpine:edge
LABEL maintainer="TossPig <docker@TossP.com>" \
      version="CI_TAG" \
      description="teaweb"
ENV TIMEZONE Asia/Shanghai
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
RUN apk update && apk upgrade && apk add tzdata
RUN cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
RUN apk del tzdata && rm -rf /var/cache/apk/*
ADD . /teaweb
EXPOSE 7777
VOLUME ["/teaweb/backups"]
ENTRYPOINT [ "/teaweb/bin/teaweb" ]