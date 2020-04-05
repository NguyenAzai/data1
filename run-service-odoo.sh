
sudo service postgresql start
sudo /etc/init.d/postgresql start
sudo service postgresql restart
sudo su - odoo13 -c "/opt/odoo13/odoo-venv/bin/python3 /opt/odoo13/odoo/odoo-bin -c /etc/odoo13.conf"

