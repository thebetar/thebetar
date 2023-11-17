# Setup VIM configuration
echo "[Status] Setting up VIM configuration"
cp -r ./vim/.vim/* ~/.vim                 # Add VIM plugins
cp ./vim/.vimrc ~/.vimrc                # Overwrite Vim configuration

# OH MY ZSH CONFIG
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  ## Install oh-my-zsh
  echo "[Status] Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "[Status] oh-my-zsh already installed"
fi

## Copy over standard config
echo "[Status] Copying over zsh config"
cp ./.zshrc ~/.zshrc
