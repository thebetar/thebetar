source $PWD/install.sh

DOT_FILES="$PWD/dotfiles"

# Setup nodejs
echo "[Status] Setting up NodeJS"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install --lts

# Setup vscode
echo "[Status] Setting up VSCode configuration"
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code
## Copying vscode settings
cp -r "$DOT_FILES/vscode/." ~/.config/Code/User

# Install docker
sudo apt-get install ca-certificates
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install i3
echo "[Status] Install i3 window manager"
sudo apt update
sudo apt install i3 rofi nitrogen blueman net-tools flameshot
## Copying i3 config
cp "$DOT_FILES/i3/i3-config" ~/.config/i3/config
## Copying i3status config
mkdir ~/.config/i3status
cp "$DOT_FILES/i3/i3status-config" ~/.config/i3status/config
## Copying rofi config
mkdir ~/.config/rofi
cp "$DOT_FILES/i3/rofi-config" ~/.config/rofi/config.rasi

# Final remarks
echo "[Status] Setup complete"
echo "[Status] Please restart your terminal"
echo "Todo list:"
echo "  - Install Spotify (https://www.spotify.com/nl/download/linux/)"
