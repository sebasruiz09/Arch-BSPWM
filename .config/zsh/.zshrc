source ~/.config/zsh/.zshprofile

eval "$(starship init zsh)"


#plugins=(git)

#source ~/.config/zsh/.oh-my-zsh/oh-my-zsh.sh

alias zrc='source ~/.zshrc'
alias vim='nvim'
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias dir='lsd'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd'
alias cat='/usr/bin/bat --paging=never'
alias catnl='bat'
alias icat='kitty +kitten icat'
alias img='wezterm imgcat'
alias vi='~/scripts/navigator.sh'
alias emulator='~/scripts/emulator.sh'
alias vpn='~/scripts/vpn.sh'
alias clip='xclip -sel clipboard <'
alias autoremove='sudo pacman -R $(pacman -Qdtq)'
alias connect='nmcli device wifi connect'
alias lg='lazygit'
alias pdf='termpdf'
alias ia='ollama run openchat'


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:/opt/flutter/bin

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export PATH="$(yarn global bin):$PATH"

source ~/.config/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval $(keychain --eval -q rsa_work rsa_personal)


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

if [ -z "$TMUX" ]; then
    tmux
fi


# Load Angular CLI autocompletion.
source <(ng completion script)
