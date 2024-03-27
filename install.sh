# Setup VIM configuration
echo "[Status] Setting up VIM configuration"
cp -r "$PWD/vim/.vim/*" ~/.vim                 # Add VIM plugins
cp "$PWD/vim/.vimrc" ~/.vimrc                # Overwrite Vim configuration

# Install base deps
echo "[Status] Installing base dependencies"
apt install tmux
apt install zsh
apt install curl
apt install git

# OH MY ZSH CONFIG
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  ## Install oh-my-zsh
  echo "[Status] Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  ## Install zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  ## Install zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  ## Install fzf
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
else
  echo "[Status] oh-my-zsh already installed"
fi

## Copy over standard zsh config
echo "[Status] Copying over zsh config"
cp "$PWD/.zshrc" ~/.zshrc

## Copy over standard tmux config
echo "[Status] Copying over tmux config"
cp "$PWD/tmux/.tmux.conf" ~/.tmux.conf
tmux source-file ~/.tmux.conf

# Setup custom binaries
echo "[Status] Copying custom binaries"
sudo cp -r "$PWD/usr/local/bin/." ~/.local/bin

# Set path to custom binaries
export PATH="$HOME/.local/bin:$PATH"

# Final remarks
echo "[Status] Setup complete"
echo "[Status] Please restart your terminal"
