#!/bin/sh
DIRSCRIPT=$( cd "$( dirname "$0" )" && pwd )

bash $DIRSCRIPT/install-emacs.sh
bash $DIRSCRIPT/install-apache.sh
bash $DIRSCRIPT/install-mysql.sh
bash $DIRSCRIPT/install-php.sh
bash $DIRSCRIPT/install-symfony.sh
bash $DIRSCRIPT/install-phpmyadmin.sh
