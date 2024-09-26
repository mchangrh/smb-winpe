FROM alpine:latest
RUN apk add --no-cache samba tini && \
  adduser -SDH wininstall
COPY smb.conf /etc/samba/smb.conf --chmod 644
COPY docker-entrypoint.sh /docker-entrypoint.sh --chmod 755
# volume for samba auth
VOLUME /var/lib/samba
ENTRYPOINT ["/sbin/tini", "--", "/docker-entrypoint.sh"]