#!/bin/sh
DIRSCRIPT=$( cd "$( dirname "$0" )" && pwd )

if ! [ -x "$(command -v mysql)" ]; then
    echo 'Mysql is not installed. Installing...' >&2
	export DEBIAN_FRONTEND="noninteractive"
    sudo apt-get install -y mysql > /dev/null
else
    echo 'Mysql already installed. Skipping...'
fi

