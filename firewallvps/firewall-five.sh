#!bin/sh
port="porta"

echo "Qual porta deseja liberar no seu firewall?"
read port

sudo iptables -F
sudo iptables -A INPUT -p tcp --dport $port -j ACCEPT
sudo iptables -A INPUT -p udp --dport $port -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport $port -j ACCEPT
sudo iptables -A OUTPUT -p udp --dport $port -j ACCEPT
