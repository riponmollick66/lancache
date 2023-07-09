# Start services at boot
#====#===========#===========
/bin/systemctl enable bind9 nginx	;

# Restart the services
#====#===========#===========
/bin/systemctl restart bind9 nginx	;

# Show services status
#====#===========#===========
/bin/systemctl status bind9 nginx	;