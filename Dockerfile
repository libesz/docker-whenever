FROM alpine:3

COPY whenever.sh /
RUN apk add inotify-tools
ENTRYPOINT ["/whenever.sh"]
