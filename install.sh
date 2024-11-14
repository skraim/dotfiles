DOT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

sudo apt install --assume-yes curl autoconf gcc make pkg-config libpam0g-dev libcairo2-dev \
    libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev \
    libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev \
    libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev vim imagemagick cava autoconf gcc libev-dev \
    make cmake zsh stow polybar chromium ripgrep fzf tmux tmuxp freecad btop calc docker-compose \
    openjdk-17-jdk nodejs npm qbittorrent python3-pip rofi feh picom bspwm sxhkd lxsession \
    flameshot dunst pipx alacritty bluez-tools

mkdir -p $HOME/tmp

# change shell to zsh
sudo chsh -s /bin/zsh $USER

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/powerlevel10k

# kitty
mkdir $HOME/.local/share/applications
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln -s $HOME/.local/kitty.app/bin/kitty $HOME/.local/bin/kitty
ln -s $HOME/.local/kitty.app/bin/kitten $HOME/.local/bin/kitten
cp $HOME/.local/kitty.app/share/applications/kitty.desktop $HOME/.local/share/applications/
sed -i "s|Icon=kitty|Icon=$HOME/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" $HOME/.local/share/applications/kitty.desktop
sed -i "s|Exec=kitty|Exec=$HOME/.local/bin/kitty|g" $HOME/.local/share/applications/kitty.desktop
sed -i "s|TryExec=kitty|TryExec=$HOME/.local/bin/kitty|g" $HOME/.local/share/applications/kitty.desktop

# zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-auto-notify.git $HOME/.zsh/zsh-auto-notify
git clone https://github.com/zsh-users/zsh-history-substring-search.git $HOME/.zsh/zsh-history-substring-search

# ua keyboard layouts
sudo $DOT_DIR/kb-layout/install.sh

# rofi
cd $HOME
git clone --depth=1 -b custom https://github.com/skraim/rofi.git 
cd rofi 
./setup.sh

# kbdd
cd $HOME
git clone https://github.com/qnikst/kbdd.git
cd kbdd
aclocal; automake --add-missing; autoreconf
./configure options
make
make install

# brave
# sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
# echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
# sudo apt update
# sudo apt install brave-browser

# nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# spotify
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

# qmk
python3 -m pip install --break-system-packages --user qmk

# pywal
pipx install pywal16

# i3lock
cd $HOME
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
./build.sh
./install-i3lock-color.sh

# betterlockscreen
wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | bash -s user

cd $DOT_DIR

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

# HYPRLAND: 
# stow waybar
# stow wlogout
# stow hypr

cp $DOT_DIR/custom-states/states $HOME/
mkdir -p $HOME/.config/dunst
ln -s $HOME/.cache/wal/colors-dunst $HOME/.config/dunst/dunstrc

mkdir -p $HOME/Pictures/wallpapers/
cp $DOT_DIR/wallpapers/1216465.jpg $HOME/Pictures/wallpapers/

betterlockscreen -u $HOME/Pictures/wallpapers/1216465.jpg

cd $HOME/tmp
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Meslo.zip
unzip -d $HOME/.fonts/ Meslo

rm -f $HOME/tmp

