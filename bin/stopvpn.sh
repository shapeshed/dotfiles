#!/bin/bash

/usr/sbin/ipsec auto --down L2TP-PSK
/bin/echo "d vpn-connection" > /var/run/xl2tpd/l2tp-control
/usr/bin/systemctl stop xl2tpd 
/usr/bin/systemctl stop openswan
