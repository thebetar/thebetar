# Setup VIM configuration
echo "[Status] Setting up VIM configuration"
cp -r ./vim/.vim/* ~/.vim                 # Add VIM plugins
cp ./vim/.vimrc ~/.vimrc                # Overwrite Vim configuration

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

## Copy over standard config
echo "[Status] Copying over zsh config"
cp ./.zshrc ~/.zshrc
