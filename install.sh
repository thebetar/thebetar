cp -r ./.vim ~/.vim                 # Add Vim plugins
cp ./.vimrc ~/.vimrc                # Overwrite Vim configuration


if [ -f "~/.confing/nvim" ]; then   # Check if Neovim exists
  cp -r ./nvim ~/.config/nvim       # Add Neovim plugins and configuration
fi

