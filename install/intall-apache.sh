#!/bin/sh
DIRSCRIPT=$( cd "$( dirname "$0" )" && pwd )

if ! [ -x "$(command -v apache2)" ]; then
    echo 'Apache2 is not installed. Installing...' >&2
    sudo apt-get install -y apache2 apache2-mpm-itk > /dev/null
else
    echo 'Apache2 already installed. Skipping...'
fi

