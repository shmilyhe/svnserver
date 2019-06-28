#!/bin/sh
httpd -k start
/usr/bin/svnserve -d --foreground -r /data/svn
