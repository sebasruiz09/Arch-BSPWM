if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zshprofile

export MONITOR=HDMI-1-1

source ~/utils/powerlevel10k/powerlevel10k.zsh-theme

# export preferred FILE_MANAGER 
export FILE_MANAGER=nautilus

export ZSH="$HOME/.oh-my-zsh"
plugins=(git)

# alias for faster common commands
alias zrc='source ~/.zshrc'
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias dir='lsd'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd'
alias cat='/usr/bin/bat --paging=never'
alias catnl='bat'
alias icat='kitty +kitten icat'
alias vi='nvim .'
alias explorer='nautilus . &'
alias clip='xclip -sel clipboard <'
alias autoremove='sudo pacman -R $(pacman -Qdtq)'
alias connect='nmcli device wifi connect'

source $ZSH/oh-my-zsh.sh

source ~/utils/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/utils/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# export NVM path
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:/opt/flutter/bin

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

# add rsa_private in this line for keichain load your ssh keys in ssh agent 
# dont add public key only private keys
# example : eval $(keychain --eval -q key1 key2 )
eval $(keychain --eval -q rsa_work rsa_personal)

# Load Angular CLI autocompletion.
source <(ng completion script)

# sudo plugins
 sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}
zle -N sudo-command-line
# to add sudo by hitting esc twice
bindkey "\e\e" sudo-command-line

