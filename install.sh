#!/bin/bash
#
###### !!! do not execute, still under development

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
sudo pacman -S git cmake clang xorg-xinit xorg-xinput xorg-xrandr xorg-server mesa mesa-demos

#install polybar
sudo pacman -S polybar 

#install picom
sudo pacman -S picom meson

#install additional packages
sudo pacman -S nvim zsh xclip bat lsd neofetch sxhkd bspwm kitty feh rofi flameshot networkmanager pavucontrol pulseaudio pulseaudio-alsa

#install plugins for zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir ~/utils
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/utils/zsh-syntax-highlighting
git clone https://github.com/marlonrichert/zsh-autocomplete.git  ~/utils/zsh-autocomplete

# copy zsh config files
rm -rf ~/.zshrc

cp -v "$route/.p10k.zsh" ~/
cp -v "$route/.zshrc" ~/

# isntall fonts
cp -v "$route/fonts/*" /usr/share/fonts

# install wallpaper
mkdir ~/wallpaper
cp -v $route/wallpaper/* ~/wallpaper

#copy config files
cp -rv $route/.config ~/.config/

# copy xinitrc
cp -v $route/.xinitrc ~/

# set default shell
chsh -s $(which zsh)

# execution permissions
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/scripts/bspwm_resize

# end 
notify-send "desktop ready for use, please restart and use xinitrc or select bspwm session"
