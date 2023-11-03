#!/bin/bash
#
# recognize the user
if [ "$(whoami)" == "root" ]; then
    echo "do not execute this file as root"
    exit 1
fi

# get current route
route=$(pwd)

#system update 
sudo pacman -Syu

#install prerequisites
sudo pacman -S git cmake clang xorg-xinit xorg-xinput xorg-xrandr xorg-server mesa mesa-demos xorg-fonts

#install polybar
sudo pacman -S polybar 

#install picom
sudo pacman -S picom meson

#install additional packages
sudo pacman -S neovim zsh xclip bat lsd neofetch sxhkd bspwm kitty feh rofi flameshot networkmanager pavucontrol pulseaudio pulseaudio-alsa keychain brightnessctl
#manual isntall for p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

mkdir ~/utils
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/utils/zsh-syntax-highlighting
git clone https://github.com/marlonrichert/zsh-autocomplete.git  ~/utils/zsh-autocomplete

# create user default directory
sudo pacman -S xdg-user-dirs
xdg-user-dirs-update

rm -rf ~/.zshrc

# copy zsh config files
cp -v "$route/.p10k.zsh" ~/
cp -v "$route/.zshrc" ~/

# isntall fonts
sudo cp -v "$route/fonts/*" /usr/share/fonts

# install wallpaper
mkdir ~/wallpaper
cp -v $route/wallpaper/* ~/wallpaper

#copy config files
cp -rv $route/.config/* ~/.config/

# copy xinitrc
cp -v "$route/.xinitrc" ~/

# execution permissions
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/scripts/bspwm_resize
chmod +x ~/.config/rofi/scripts/launcher.sh
chmod +x ~/.config/rofi/scripts/powermenu.sh

echo "bspwm ready, reboot and start xserver or select section in your display manager"
