#!/bin/bash

DOT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

sudo pacman -S sddm nvim git curl zsh ripgrep fzf tmux tmuxp btop dunst udiskie fastfetch \
    imagemagick rofi-wayland pipewire waybar hyprpaper telegram-desktop pipewire-alsa \
    pipewire-jack pipewire-pulse sof-firmware unzip bluez bluez-utils otf-font-awesome jq \
    xdg-desktop-portal-hyprland cliphist qmk hyprlock hypridle brightnessctl wget cronie \
    wireplumber xorg-xhost timashift yazi jdk-openjdk maven ffmpegthumbnailer p7zip poppler fd \
    zoxide vlc ctags bc pavucontrol powertop handlr-regex qbittorrent

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

paru -S python-pywal16 librewolf-bin spotify python-pip bluetui hyprland-per-window-layout \
    hyprshot hyprsunset sddm-sugar-dark hyprland-qtutils

sudo systemctl enable sddm

# change shell to zsh
sudo chsh -s /bin/zsh $USER

# zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-auto-notify.git $HOME/.zsh/zsh-auto-notify
git clone https://github.com/zsh-users/zsh-history-substring-search.git $HOME/.zsh/zsh-history-substring-search

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/powerlevel10k

# ua keyboard layouts
sudo $DOT_DIR/kb-layout/install.sh

mkdir -p $HOME/tmp

# rofi
cd $HOME
git clone --depth=1 -b custom https://github.com/skraim/rofi.git 
cd rofi 
./setup.sh
cd $DOT_DIR

stow nvim
stow zsh
stow tmux
stow tmuxp
stow lazygit
stow wal
stow scripts
stow kitty
stow yazi
stow handlr

# bspwm
# stow picom
# stow bspwm
# stow polybar
# stow sxhkd
# stow betterlockscreen

# hyprland
stow waybar
stow wlogout
stow hypr

ya pack -a yazi-rs/plugins:smart-enter
ya pack -a yazi-rs/plugins:full-border

cp $DOT_DIR/custom-states/states $HOME/
mkdir -p $HOME/.config/dunst
ln -s $HOME/.cache/wal/colors-dunst $HOME/.config/dunst/dunstrc

mkdir -p $HOME/Pictures/wallpapers/
cp $DOT_DIR/wallpapers/1216465.jpg $HOME/Pictures/wallpapers/

cd $HOME/tmp
mkdir -p ~/.local/share/icons
curl -LO https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata-Modern-Classic.tar.xz
tar -xvf Bibata-Modern-Classic.tar.xz
cp -r Bibata-Modern-Classic ~/.local/share/icons/
sudo mv Bibata-Modern-Classic /usr/share/icons/
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Meslo.zip
unzip -d $HOME/.fonts/ Meslo

cd $HOME
mkdir -p ~/icons/default
cd ~/.icons/default
echo "[icon theme]\nInherits=Bibata-Modern-Classic" >> index.theme
ln -s /usr/share/icons/Bibata-Modern-Classic/cursors ~/.icons/default/cursors

sed -i "1i export PATH=\"\$HOME/.local/bin:\$HOME/scripts:/usr/mvn/apache-maven-3.9.6/bin:\$HOME/bin:/opt/nvim-linux64/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:\$PATH\"" $HOME/.bashrc

rm -r $HOME/tmp

curl -sSL https://codeberg.org/PassFF/passff-host/releases/download/latest/install_host_app.sh | bash -s -- librewolf
