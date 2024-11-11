sudo apt install --assume-yes curl \
    autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev \
    libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev \
    libxcb-util0-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev vim fastfetch \
    imagemagick cava autoconf gcc libev-dev make cmake zsh zplug stow polybar chromium ripgrep \
    fzf tmux tmuxp freecad btop calc docker-compose openjdk-17-jdk nodejs npm qbittorrent \
    python3-pip rofi feh picom bspwm sxhkd lxsession flameshot dunst pipx alacritty

mkdir -p ~/tmp

sudo chsh -s /bin/zsh $USER

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
ln -s ~/.local/kitty.app/bin/kitten ~/.local/bin/kitten
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-auto-notify.git ~/.zsh/zsh-auto-notify
git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.zsh/zsh-history-substring-search

curl -s https://ohmyposh.dev/install.sh | bash -s
oh-my-posh enable upgrade

sudo ./kb-layout/install.sh

cd $HOME
git clone --depth=1 -b custom https://github.com/skraim/rofi.git
cd rofi 
./setup.sh

cd $HOME
git clone https://github.com/qnikst/kbdd.git
cd kbdd
aclocal; automake --add-missing; autoreconf
./configure options
make
make install
cd $HOME

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

python3 -m pip install --break-system-packages --user qmk

# sudo apt install pipx
pipx install pywal16
# sudo pip3 install --break-system-packages pywal16

cd $HOME
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
./build.sh
./install-i3lock-color.sh

wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | bash -s user

# bambustudio
# betaflight
# bluetooth-autoconnect
# bnuetuith
# ksnip
# flameshot
# vpn 
cd $HOME/dotfiles

stow nvim
stow zsh
stow tmuxp
stow lazygit
stow wal
stow scripts

# bspwm
stow picom
stow bspwm
stow polybar
stow sxhkd
stow betterlockscreen

stow ohmyposh
# HYPRLAND: 
# stow waybar
# stow wlogout
# stow hypr

cp ./custom-states/states $HOME/
mkdir -p $HOME/.config/dunst
ln -s $HOME/.cache/wal/colors-dunst $HOME/.config/dunst/dunstrc

mkdir -p ~/Pictures/wallpapers/
cp ./wallpapers/1216465.jpg ~/Pictures/wallpapers/

betterlockscreen -u ~/Pictures/wallpapers/1216465.jpg

cd ~/tmp
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Meslo.zip
unzip -d ~/.fonts/ Meslo

