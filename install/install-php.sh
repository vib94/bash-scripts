#!/bin/sh
DIRSCRIPT=$( cd "$( dirname "$0" )" && pwd )
if ! [ -x "$(command -v php)" ]; then
    echo 'Php is not installed. Installing...' >&2
    apt-get install -y php5 php5-gd php5-mysql php5-mcrypt php5-curl > /dev/null
	echo 'Done'
else
    echo 'Emacs already installed. Skipping...'
fi

