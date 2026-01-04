DOT_FILES="$PWD/dotfiles"

# Setup VIM configuration
echo "[Status] Setting up VIM configuration"
cp -r "$DOT_FILES/vim/.vim/." ~/.vim                 # Add VIM plugins
cp "$DOT_FILES/vim/.vimrc" ~/.vimrc                # Overwrite Vim configuration

# Install base deps
echo "[Status] Installing base dependencies"
sudo apt install tmux zsh curl git vim -y

## Copy over standard zsh config
echo "[Status] Copying over zsh config"
cp "$DOT_FILES/.zshrc" ~/.zshrc

## Copy over standard tmux config
echo "[Status] Copying over tmux config"
cp "$DOT_FILES/.tmux.conf" ~/.tmux.conf
tmux source-file ~/.tmux.conf

# OH MY ZSH CONFIG
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "[Status] Installing oh-my-zsh"

  ## Install zsh-autosuggestions
  sudo apt install zsh-autosuggestions zsh-syntax-highlighting fzf -y

  ## Install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "[Status] oh-my-zsh already installed"
fi

# Final remarks
echo "[Status] Setup complete"
echo "[Status] Please restart your terminal"