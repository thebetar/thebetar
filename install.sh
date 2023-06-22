# Setup VIM configuration
cp -r ./vim/.vim ~/.vim             # Add VIM plugins
cp ./vim/.vimrc ~/.vimrc                # Overwrite Vim configuration

# Install neovim since it does not come preinstalled
if [ ! -f "~/.config/nvim" ]; then
  mkdir tmp
  cd tmp

  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage

  ./nvim.appimage --appimage-extract
  ./squashfs-root/AppRun --version
  sudo mv squashfs-root /
  sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
fi

# Install neovim settings
if [ -f "~/.config/nvim" ]; then
  cp -r ./nvim ~/.config/nvim
fi

# OH MY ZSH CONFIG

# Install fonts needed for zsh config
git clone https://github.com/powerline/fonts &&
  \ ./fonts/install.sh &&
  \ rm -rf fonts

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Copy over standard config
cp ./.zshrc ~/.zshrc

