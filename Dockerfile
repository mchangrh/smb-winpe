FROM alpine:latest
RUN apk add --no-cache samba tini && \
  adduser -SDH wininstall
COPY root /
# volume for samba auth
VOLUME /var/lib/samba
ENTRYPOINT ["/sbin/tini", "--", "/docker-entrypoint.sh"]