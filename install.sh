DOT_FILES="$PWD/dotfiles"

# Setup VIM configuration
echo "[Status] Setting up VIM configuration"
cp -r "$DOT_FILES/vim/.vim/." ~/.vim                 # Add VIM plugins
cp "$DOT_FILES/vim/.vimrc" ~/.vimrc                # Overwrite Vim configuration

# Install base deps
echo "[Status] Installing base dependencies"
sudo apt install tmux zsh curl git

# OH MY ZSH CONFIG
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  ## Install oh-my-zsh
  echo "[Status] Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  ## Install zsh-autosuggestions
  sudo apt install zsh-autosuggestions

  ## Install zsh-syntax-highlighting
  sudo apt install zsh-syntax-highlighting

  ## Install fzf
  sudo apt install fzf
else
  echo "[Status] oh-my-zsh already installed"
fi

## Copy over standard zsh config
echo "[Status] Copying over zsh config"
cp "$DOT_FILES/.zshrc" ~/.zshrc

## Copy over standard tmux config
echo "[Status] Copying over tmux config"
cp "$DOT_FILES/.tmux.conf" ~/.tmux.conf
tmux source-file ~/.tmux.conf

# Setup custom binaries
echo "[Status] Copying custom binaries"
sudo cp -r "$DOT_FILES/usr/local/bin/." /usr/local/bin

# Final remarks
echo "[Status] Setup complete"
echo "[Status] Please restart your terminal"