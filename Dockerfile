FROM alpine:edge
LABEL maintainer="TossPig <docker@TossP.com>" \
      version="CI_TAG" \
      description="teaweb"
ENV TIMEZONE Asia/Shanghai
RUN apk update && apk upgrade && apk add --no-cache ca-certificates tzdata && cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && apk del tzdata
ADD ./releases /teaweb
EXPOSE 7777
VOLUME ["/teaweb/backups"]
ENTRYPOINT [ "/teaweb/bin/teaweb" ]