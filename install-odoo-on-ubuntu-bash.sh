sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt install git python3-pip build-essential wget python3-dev python3-venv python3-wheel libxslt-dev libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less -y
sudo useradd -m -d /opt/odoo13 -U -r -s /bin/bash odoo13
sudo apt-get install node-clean-css -y
sudo apt-get install node-less -y
sudo apt-get install python-gevent -y
sudo apt install postgresql -y
sudo service postgresql start
sudo su - postgres -c "createuser -s odoo13"
sudo su - postgres -c "psql -c 'create role odoo13 with login superuser;'"
wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
sudo apt install ./wkhtmltox_0.12.5-1.bionic_amd64.deb -y
sudo su - odoo13 -c "git clone https://www.github.com/odoo/odoo --depth 1 --branch 13.0 /opt/odoo13/odoo"
sudo su - odoo13 -c "cd /opt/odoo13 && python3 -m venv odoo-venv && source odoo-venv/bin/activate && pip3 install wheel && pip3 install -r odoo/requirements.txt && deactivate"
sudo su - odoo13 -c "mkdir /opt/odoo13/odoo-custom-addons"

sudo touch /etc/odoo13.conf

sudo su root -c "printf '[options] \n; This is the password that allows database operations:\n' >> /etc/odoo13.conf"

sudo su root -c "printf 'admin_passwd = my_admin_passwd\n' >> /etc/odoo13.conf"

sudo su root -c "printf 'xmlrpc_port = 8069\n' >> /etc/odoo13.conf"

sudo su root -c "printf 'db_host = False\n' >> /etc/odoo13.conf"
sudo su root -c "printf 'db_port = False\n' >> /etc/odoo13.conf"
sudo su root -c "printf 'db_user = odoo13\n' >> /etc/odoo13.conf"
sudo su root -c "printf 'db_password = False\n' >> /etc/odoo13.conf"

sudo su root -c "printf 'addons_path = /opt/odoo13/odoo/addons,/opt/odoo13/odoo-custom-addons\n' >> /etc/odoo13.conf"

sudo chown odoo13:odoo13 /etc/odoo13.conf

sudo chmod 640 /etc/odoo13.conf

echo "Installation Done"