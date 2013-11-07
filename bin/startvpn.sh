#!/bin/bash

/usr/bin/systemctl start openswan
sleep 2
/usr/bin/systemctl start xl2tpd 
/usr/sbin/ipsec auto --up L2TP-PSK                        
/bin/echo "c vpn-connection" > /var/run/xl2tpd/l2tp-control     
sleep 4 
