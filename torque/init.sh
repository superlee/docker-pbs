hostname -f > /var/spool/torque/server_name
/usr/local/sbin/trqauthd &
yes|$(ls -d torque*)/torque.setup root
