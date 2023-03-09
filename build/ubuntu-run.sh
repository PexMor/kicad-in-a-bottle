#!/bin/bash

ln -sf /dev/stdout /var/log/xdummy.log
ln -sf /dev/stdout /var/log/xrdp.log
ln -sf /dev/stdout /var/log/xrdp-sesman.log

/usr/sbin/xrdp-sesman
/usr/sbin/xrdp

sleep infinity

