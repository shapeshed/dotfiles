sudo systemctl start openvpn@bede.service
sleep 10
sudo route del -net 31.0.0.0/8       

