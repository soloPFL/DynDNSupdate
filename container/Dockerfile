FROM alpine:3.16

LABEL author="https://github.com/Brottus" version="1.0"

ENV user= password= host= sleeptimer=2160

RUN apk add --no-cache bash curl moreutils

RUN addgroup -S ipsync && adduser -S ipsync -G ipsync

COPY --chown=ipsync:ipsync ipsync.sh /app/

WORKDIR /app

RUN chmod 755 ipsync.sh

#RUN chown -R ipsync:ipsync /app

USER ipsync

CMD ["./ipsync.sh"]

HEALTHCHECK --interval=15m --timeout=3s \
  CMD if pidof -s "ipsync.sh" >/dev/null; then exit 0; else exit 1; fi
