#!/usr/bin/with-contenv bashio

server_addr=$(bashio::config 'server_addr')
server_port=$(bashio::config 'server_port')
token=$(bashio::config 'token')
local_ip=$(bashio::config 'local_ip')
local_port=$(bashio::config 'local_port')
remote_port=$(bashio::config 'remote_port')

# Create FRP configuration file
echo "[common]" > /etc/frpc.ini
echo "server_addr = ${server_addr}" >> /etc/frpc.ini
echo "server_port = ${server_port}" >> /etc/frpc.ini
echo "token = ${token}" >> /etc/frpc.ini

echo "[ha_dashboard]" >> /etc/frpc.ini
echo "type = tcp" >> /etc/frpc.ini
echo "local_ip = ${local_ip}" >> /etc/frpc.ini
echo "local_port = ${local_port}" >> /etc/frpc.ini
echo "remote_port = ${remote_port}" >> /etc/frpc.ini

echo "--------------- FRP Configuration (frpc.ini): -----------------------"
cat /etc/frpc.ini
echo "Starting FRP Service..."
/usr/local/bin/frpc -c /etc/frpc.ini