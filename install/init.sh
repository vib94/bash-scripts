#!/bin/sh
TAR="$(which tar)"
MYSQLDUMP="$(which mysqldump)"
GZIP="$(which gzip)"
LOGGER="$(which logger)"

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

dpkg-reconfigure locales
dpkg-reconfigure tzdata

apt-get update
apt-get full
apt-get -y install emacs
apt-get -y install zip unzip gcc diff wget bzip2 make
apt-get -y install htop apticron fail2ban rkhunter
apt-get -y install apache2 apache2-mpm-itk
apt-get -y install git-core mysql-server php5 php5-gd php5-mysql php5-mcrypt php5-curl
apt-get -y install php-apc

update-alternatives --set editor `update-alternatives --list editor |grep emacs`

a2enmod rewrite
a2enmod expires

if [ ! -f ~/.emacs ]; then
    echo "le fichier existe pas !"
    touch  ~/.emacs
fi

#echo "(set-language-environment ""UTF-8"")" >> ~/.emacs
echo "(column-number-mode 1)" >> ~/.emacs
echo "(line-number-mode 1)" >> ~/.emacs
echo "(setq scroll-step 1)" >> ~/.emacs
echo "(global-hl-line-mode 1)" >> ~/.emacs
echo "(setq standard-indent 2)" >> ~/.emacs
echo "(setq make-backup-files nil)" >> ~/.emacs
#echo "(global-set-key [f2] save-buffer)" >> ~/.emacs

echo "export LESS_TERMCAP_mb=$'\E[01;31m'" >> /etc/profile
echo "export LESS_TERMCAP_md=$'\E[01;31m'" >> /etc/profile
echo "export LESS_TERMCAP_me=$'\E[0m'" >> /etc/profile
echo "export LESS_TERMCAP_se=$'\E[0m'" >> /etc/profile
echo "export LESS_TERMCAP_so=$'\E[01;44;33m'" >> /etc/profile
echo "export LESS_TERMCAP_ue=$'\E[0m'" >> /etc/profile
echo "export LESS_TERMCAP_us=$'\E[01;32m'" >> /etc/profile
echo "export PAGER='less'" >> /etc/profile



