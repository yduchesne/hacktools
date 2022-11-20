#!/bin/bash

set -e

echo ""
echo "Installing core dependencies"
echo "============================"
echo ""

export DOWNLOADS_DIR="$HOME/Downloads"

echo ""
echo "Installing Snap"
echo "---------------"
echo ""
sudo apt install snapd
sudo systemctl enable --now snapd apparmor

echo ""
echo "Installing Go"
echo "-------------"
echo ""

GO_TAR_URL=https://go.dev/dl/go1.19.3.linux-amd64.tar.gz
GO_LOCAL_ARCHIVE="$DOWNLOADS_DIR/go-install.tar.gz"

if ! [ -e "$GO_LOCAL_ARCHIVE" ]; then
	curl -J -L -o "$GO_LOCAL_ARCHIVE" $GO_TAR_URL
fi

echo "Unzipping Go install archive: $GO_LOCAL_ARCHIVE"
sudo rm -rf /user/local/go && sudo tar --directory /usr/local -zxf "$GO_LOCAL_ARCHIVE"

if ! [ "$GO_HOME" = "" ]; then
	echo "GO_HOME=/usr/local/go" >> $HOME/.profile
	echo "export PATH=\$PATH:\$GO_HOME/bin" >> $HOME/.profile
fi

source $HOME/.profile

# Other deps
./recon/install.sh
