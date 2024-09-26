FROM alpine:latest
RUN apk add --no-cache samba tini && \
  adduser -SDH wininstall
COPY --chmod=644 smb.conf /etc/samba/smb.conf
COPY --chmod=755 docker-entrypoint.sh /docker-entrypoint.sh 
# volume for samba auth
VOLUME /var/lib/samba
ENTRYPOINT ["/sbin/tini", "--", "/docker-entrypoint.sh"]