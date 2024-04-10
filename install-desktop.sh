source $PWD/install.sh

# Setup NVIM
echo "[Status] Setting up NVIM configuration"
sudo apt install nvim
cp -r "$DOT_FILES/nvim/." ~/.config/nvim

# Setup nodejs
echo "[Status] Setting up NodeJS"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install 20

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
cp -r "$DOT_FILES/vscode/." ~/.config/Code/User

# Install docker
echo "[Status] Setting up Docker"

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Final remarks
echo "[Status] Setup complete"
echo "[Status] Please restart your terminal"
echo "Todo list:"
echo "  - Install Docker (https://docs.docker.com/engine/install/)"
echo "  - Install Spotify (https://www.spotify.com/nl/download/linux/)"
echo "  - Install MongoDB shell (https://www.mongodb.com/docs/mongodb-shell/install/)"
