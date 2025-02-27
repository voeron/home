#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

# Clear the screen
clear

# Update packages list and update system
apt update
apt upgrade -y

# Installing Essential Programs 
# these are chris titus programs -> nala install feh kitty rofi picom thunar nitrogen lxpolkit x11-xserver-utils unzip wget pipewire wireplumber pavucontrol build-essential libx11-dev libxft-dev libxinerama-dev libx11-xcb-dev libxcb-res0-dev zoxide xdg-utils -y
# these are mine
apt install xserver-xephyr lightdm lightdm-gtk-greeter slick-greeter bspwm kitty polybar rofi sxhkd thunar build-essential picom feh xorg arandr firefox-esr zip unzip zsh zsh-autosuggestions zsh-syntax-highlighting vim-gtk3 ripgrep fd-find xclip python3-venv luarocks golang-go shellcheck curl tldr -y

# Installing specific version of neovim because of plugin conflicts
curl -L -O "https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb"
sudo apt install ./nvim-linux64.deb
# if this fails install
# use this:
# sudo dpkg -i --force-overwrite ./nvim-linux64.deb
# sudo apt -f install

# these are chris titus programs Installing Other less important Programs
# nala install neofetch flameshot psmisc mangohud vim lxappearance papirus-icon-theme lxappearance fonts-noto-color-emoji lightdm -y

# Taking ownership to home directory files
# I'm not sure if this is necessary in my case 
# chown $username:$username /home/$username/*

# Reloading Font
fc-cache -vf

# Install Nordzy cursor
#git clone https://github.com/alvatip/Nordzy-cursors
#cd Nordzy-cursors
#./install.sh
#cd $builddir
#rm -rf Nordzy-cursors

# Install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim --create-dirs

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Enable graphical login and change target from CLI to GUI
systemctl enable lightdm
systemctl set-default graphical.target

# Tell bspwm to use my config 
bspwm -c ~/.config/bspwm/bspwmrc

# Change to zsh instead of bash
sudo usermod --shell /bin/zsh $username 

# Enable wireplumber audio service

# sudo -u $username systemctl --user enable wireplumber.service
