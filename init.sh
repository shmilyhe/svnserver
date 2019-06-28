#!/bin/sh
mkdir -p /data/svn 
mkdir -p /data/svn/repos
svnadmin create --fs-type fsfs /data/svn/repos
chown -R apache.apache /data/svn
htpasswd -b /data/svn/passwd eric 123456
svnadmin create /data/svn/test
chown -R apache.apache /data/svn/test

