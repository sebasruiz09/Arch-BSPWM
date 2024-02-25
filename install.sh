#!/bin/sh

# who is the user
if [ "$(whoami)" == "root" ]; then
    echo "do not execute this file as root"
    exit 1
fi

# base-devel por make packages
sudo pacman -S base-devel --noconfirm

# get repository route
route=$(pwd)

# install yay and AUR repository
sudo git clone https://aur.archlinux.org/yay.git /opt/yay
sudo chown -R $(whoami):users /opt/yay

cd /opt/yay
# make yay package
makepkg -si 

cd $route

# install picom-animations version
yes | yay -S picom-simpleanims-next-git

# update system
sudo pacman -Syu --noconfirm

# install essential packages and basic xorg packages
sudo pacman -S git cmake clang xorg-xinit xorg-xinput xorg-xrandr xorg-server mesa mesa-demos xorg-fonts

# delete and create void .zshrc and symbolic link with file to use
rm -rf ~/.zshrc
touch ~/.zshrc
ln -s ~/.config/zsh/.zshrc ~/.zshrc

# install starship 
curl -sS https://starship.rs/install.sh | sh

# install other packages *audio terminal and some utils
sudo pacman -S meson neovim zsh tmux xclip bat lsd neofetch conky sxhkd bspwm kitty feh rofi flameshot networkmanager pavucontrol pulseaudio pulseaudio-alsa keychain brightnessctl --noconfirm

# copy config file to ~/.config folder
cp -rv $route/.config/* ~/.config/

# clone zsh plugins for autocomplete and highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/marlonrichert/zsh-autocomplete.git  ~/.config/zsh/.plugins/zsh-autocomplete

# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# create default user dirs if not exists
sudo pacman -S xdg-user-dirs --noconfirm
xdg-user-dirs-update

# copy wallpapers
cp -r $route/wallpaper ~/

# copy xorg init config
cp -v "$route/.xinitrc" ~/

# copy scripts
cp -r $route/scripts ~/

# permission to execute application scripts
chmod +x ~/scripts/background.sh
chmod +x ~/scripts/navigator.sh
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/rofi/scripts/launcher.sh
chmod +x ~/.config/rofi/scripts/powermenu.sh
chmod +x ~/.config/polybar/lauch.sh
chmod +x ~/.config/polybar/scripts/checkupdates
chmod +x ~/.config/polybar/scripts/updates.sh

echo "bspwm ready, reboot and start xserver or select section in your display manager"
