# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:$HOME/bin"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

# Load configurations of plugins
source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.fzf.zsh

# Which plugins would you like to load?
plugins=(
    docker 
    git
    git-auto-fetch
    web-search
    z
    zsh-autosuggestions
    zsh-interactive-cd
    zsh-syntax-highlighting
)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# User configuration

## Aliases
alias project='open-project-code'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Set NVM directory
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set PYENV directory
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi

# Early exit if opened with early exit environment variable
if [ -n "$ZSH_EARLY_EXIT" ]; then
    return
fi

# Tmux variable
default_session_name="client"

# Get tmux process ID
tmux_running=$(pgrep tmux)

# Check if tmux is running (true if not running)
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $default_session_name
    return
fi

# Check if session exists (true if session does not exist)
if ! tmux has-session -t=client 2> /dev/null; then
    tmux new-session -ds $default_session_name
fi

# Switch to selected session if session exists and tmux is running
tmux attach-session -t $default_session_name
