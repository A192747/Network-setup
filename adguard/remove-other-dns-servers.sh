while uci -q delete dhcp.@dnsmasq[0].doh_server; do :; done
while uci -q delete dhcp.@dnsmasq[0].doh_backup_server; do :; done

while uci -q delete dhcp.@dnsmasq[0].server; do :; done

uci add_list dhcp.@dnsmasq[0].server='127.0.0.1#5055'

uci commit dhcp
/etc/init.d/dnsmasq restart