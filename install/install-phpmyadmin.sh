#!/bin/sh
DIRSCRIPT=$( cd "$( dirname "$0" )" && pwd )

echo 'PhpMyAdmin is not installed. Installing...' >&2
sudo apt-get install -y phpmyadmin > /dev/null
echo "Include /etc/phpmyadmin/apache.conf" | sudo tee -a /etc/apache2/apache2.conf > /dev/null
sudo sed -e "s/\/\/ \$cfg\['Servers'\]\[\$i\]\['AllowNoPassword'\] = TRUE;/\$cfg\['Servers'\]\[\$i\]\['AllowNoPassword'\] = TRUE;/g" /etc/phpmyadmin/config.inc.php | sudo tee /tmp/configpma.inc.php > /dev/null && sudo cat /tmp/configpma.inc.php | sudo tee /etc/phpmyadmin/config.inc.php > /dev/null && sudo rm /tmp/configpma.inc.php

sudo apache2ctl restart
