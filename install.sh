/usr/bin/apt-get update	;
/usr/bin/apt-get install -y bind9* nginx-full jq curl dnsutils git	;
mkdir -p /var/cache/bind /var/log/named && chown bind:bind /var/cache/bind /var/log/named	;
cp -r /opt/lancache-main/bind/* /etc/bind/	;
chown -R bind:bind /etc/bind/	;
mkdir -m 755 -p /harddisk/cache /harddisk/logs	;
mkdir /etc/nginx/stream-enabled  ;
rm -rf /etc/nginx/sites-enabled/*
cp -r /opt/lancache-main/nginx/* /etc/nginx/	;
ln -s /etc/nginx/sites-available/10_cache.conf /etc/nginx/sites-enabled/10_generic.conf	;
ln -s /etc/nginx/sites-available/20_upstream.conf /etc/nginx/sites-enabled/20_upstream.conf	;
ln -s /etc/nginx/stream-available/10_sni.conf /etc/nginx/stream-enabled/10_sni.conf	;

# Start services at boot
#====#===========#===========
/bin/systemctl enable bind9 nginx	;

# Restart the services
#====#===========#===========
/bin/systemctl restart bind9 nginx	;

# Show services status
#====#===========#===========
/bin/systemctl status bind9 nginx	;

