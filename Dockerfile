FROM alpine:edge
LABEL maintainer="TossPig <docker@TossP.com>" \
      version="0.1.0" \
      description="teaweb"
ENV TIMEZONE Asia/Shanghai
RUN apk update && apk upgrade && apk add tzdata
RUN cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
RUN apk del tzdata && rm -rf /var/cache/apk/*
ADD . /teaweb
EXPOSE 7777
ENTRYPOINT [ "/teaweb/bin/teaweb" ]