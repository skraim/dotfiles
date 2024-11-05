sudo apt install --assume-yes curl \
    autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev \
    libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev \
    libxcb-util0-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev vim neofetch \
    imagemagick cava autoconf gcc libev-dev make cmake zsh zplug stow polybar chromium ripgrep \
    fzf tmux tmuxp freecad btop calc docker-compose openjdk-17-jdk nodejs npm qbittorrent \
    python3-pip rofi feh picom bspwm sxhkd lxsession flameshot i3lock kitty
    # alacritty \

chsh -s /bin/zsh

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

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

export PATH="$PATH:/opt/nvim-linux64/bin"


curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client


python3 -m pip install --break-system-packages --user qmk
echo 'PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bashrc && source $HOME/.bashrc

sudo pip3 install --break-system-packages pywal



# bambustudio
# betaflight
# bluetooth-autoconnect
# bnuetuith
# ksnip
# flameshot
# vpn 

stow nvim
stow zsh
stow tmuxp
stow lazygit
stow wal
stow neofetch
stow scripts

# bspwm
stow picom
stow bspwm
stow polybar
stow sxhkd
stow betterlockscreen

# HYPRLAND: 
# stow waybar
# stow wlogout
# stow hypr

# ALACRITTY:
# stow alacritty

cp ./custom-states/states $HOME/
mkdir -p $HOME/.config/dunst
ln -s $HOME/.cache/wal/colors-dunst $HOME/.config/dunst/dunstrc
echo "[push]\n    autoSetupRemote = true" | ~/.gitconfig
