# firewall
sudo ufw status verbose			# view firewall status
sudo ufw allow 53			# allow connection on port (both TCP & UDP)

# redirect port with iptables
sudo iptables -t nat -A OUTPUT -o lo -p tcp --dport 6970 -j REDIRECT --to-port 3000
