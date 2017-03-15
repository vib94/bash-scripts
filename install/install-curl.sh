#!/bin/sh
DIRSCRIPT=$( cd "$( dirname "$0" )" && pwd )
if ! [ -x "$(command -v curl)" ]; then
    echo 'Curl is not installed. Installing...' >&2
    apt-get install -y curl > /dev/null
else
    echo 'Curl already installed. Skipping...'
fi


