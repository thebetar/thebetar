# Setup VIM configuration
echo "[Status] Setting up VIM configuration"
cp -r ./vim/.vim/* ~/.vim                 # Add VIM plugins
cp ./vim/.vimrc ~/.vimrc                # Overwrite Vim configuration

# OH MY ZSH CONFIG

if [ ! -d "$HOME/.local/share/fonts" ]; then
  ## Install fonts needed for zsh config
  echo "[Status] Installing fonts"
  git clone https://github.com/powerline/fonts &&
    \ ./fonts/install.sh &&
    \ rm -rf fonts
else
  echo "[Status] Fonts already installed"
fi

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

# # Install neovim since it does not come preinstalled
# if [ ! -f "~/.config/nvim" ]; then
#   mkdir tmp
#   cd tmp

#   curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
#   chmod u+x nvim.appimage

#   ./nvim.appimage --appimage-extract
#   ./squashfs-root/AppRun --version
#   sudo mv squashfs-root /
#   sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
# fi

# # Install neovim settings
# if [ -f "~/.config/nvim" ]; then
#   cp -r ./nvim ~/.config/nvim
# fi
