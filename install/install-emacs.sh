#!/bin/sh
DIRSCRIPT=$( cd "$( dirname "$0" )" && pwd )

if ! [ -x "$(command -v emacs)" ]; then
    echo 'Emacs is not installed. Installing...' >&2
    apt-get install -y emacs > /dev/null
	echo 'Set Emacs as default editor...'
	update-alternatives --set editor `update-alternatives --list editor |grep emacs`
	echo 'Done'
else
    echo 'Emacs already installed. Skipping...'
fi
