#!/bin/sh
DIRSCRIPT=$( cd "$( dirname "$0" )" && pwd )

bash $DIRSCRIPT/install-curl.sh

if ! [ -x "$(command -v symfony)" ]; then
    echo 'Symfony is not installed. Installing...' >&2
    sudo mkdir -p /usr/local/bin
    sudo curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
    sudo chmod a+x /usr/local/bin/symfony
else
    echo 'Symfony already installed. Skipping...'
fi

