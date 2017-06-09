#!/usr/bin/env bash

sed -i -e 's/^[!]include auth/#!include auth/' \
       -e 's/^#!include auth-passwdfile/!include auth-passwdfile/' \
       /etc/dovecot/conf.d/10-auth.conf

echo "user:{plain}password:$SUDO_UID:$SUDO_GID::$PWD::userdb_mail=maildir:~/Maildir allow_nets=0.0.0.0/0" > /etc/dovecot/users
chown -c dovecot:dovecot /etc/dovecot/users
chmod -c 0640 /etc/dovecot/users

service dovecot restart
