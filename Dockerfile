FROM alpine:3

COPY whenever.sh /
RUN apk add inotify-tools docker
ENTRYPOINT ["/whenever.sh"]
