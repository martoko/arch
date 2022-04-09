#!/bin/sh
set -e

# Install a package from source
install_source() {
  echo "Installing $1"
  cd packages/$1
  makepkg --syncdeps --install --needed --noconfirm
  cd ../..
}

# Install a package from the arch repository
install_repo() {
  echo "Installing $1"
  sudo pacman -S --needed --noconfirm $1
}


install_repo dash
echo 'Changing the default /bin/sh -> /bin/bash symlink to use dash instead'
sudo ln -sfT dash /usr/bin/sh


install_source dwm # Window manager
install_source st # Terminal emulator
install_source surf # Browser
install_source mpv # Video/audio player

install_repo mupdf # PDF/comic viewer
