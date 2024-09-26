#!/bin/sh
# set smb password
PASSWORD=${SMB_PASSWORD:-"wininstall"}
printf "%s\n%s" "$PASSWORD" "$PASSWORD" | smbpasswd -a -s wininstall
echo "starting smbd"
smbd --foreground --no-process-group