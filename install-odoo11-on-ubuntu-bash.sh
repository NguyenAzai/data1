sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt install git python3-pip build-essential wget python3-dev python3-venv python3-wheel libxslt-dev libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less -y
sudo useradd -m -d /opt/odoo11 -U -r -s /bin/bash odoo11
sudo apt-get install node-clean-css -y
sudo apt-get install node-less -y
sudo apt-get install python-gevent -y
sudo apt install postgresql -y
sudo service postgresql start
sudo su - postgres -c "createuser -s odoo11"
sudo su - postgres -c "psql -c 'create role odoo11 with login superuser;'"
wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
sudo apt install ./wkhtmltox_0.12.5-1.bionic_amd64.deb -y
sudo su - odoo11 -c "git clone https://www.github.com/odoo/odoo --depth 1 --branch 11.0 /opt/odoo11/odoo"
sudo su - odoo11 -c "cd /opt/odoo11 && python3 -m venv odoo-venv && source odoo-venv/bin/activate && pip3 install wheel && pip3 install -r odoo/requirements.txt && deactivate"
sudo su - odoo11 -c "mkdir /opt/odoo11/odoo-custom-addons"

sudo touch /etc/odoo11.conf

sudo su root -c "printf '[options] \n; This is the password that allows database operations:\n' >> /etc/odoo11.conf"

sudo su root -c "printf 'admin_passwd = my_admin_passwd\n' >> /etc/odoo11.conf"

sudo su root -c "printf 'xmlrpc_port = 9069\n' >> /etc/odoo11.conf"

sudo su root -c "printf 'db_host = False\n' >> /etc/odoo11.conf"
sudo su root -c "printf 'db_port = False\n' >> /etc/odoo11.conf"
sudo su root -c "printf 'db_user = odoo11\n' >> /etc/odoo11.conf"
sudo su root -c "printf 'db_password = False\n' >> /etc/odoo11.conf"

sudo su root -c "printf 'addons_path = /opt/odoo11/odoo/addons,/opt/odoo11/odoo-custom-addons\n' >> /etc/odoo11.conf"

sudo chown odoo11:odoo11 /etc/odoo11.conf

sudo chmod 640 /etc/odoo11.conf

echo "Installation Done"