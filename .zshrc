HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt hist_expire_dups_first
setopt inc_append_history
setopt share_history

source ~/.zsh/antigen.zsh
ADOTDIR=$HOME/.zsh
export NVM_AUTO_USE=true
export HOST=$HOST

antigen use oh-my-zsh
antigen bundles <<EOB
    git-prompt
    git
    pip
    command-not-found
    extract
    archlinux
    sudo
    systemd
    virtualenv
#    virtualenvwrapper
    gitignore
    vagrant
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-completions src
    history-substring-search
EOB

antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle lukechilds/zsh-nvm
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle MichaelAquilina/zsh-autoswitch-virtualenv

antigen apply

zstyle ":completion:*:commands" rehash 1
unsetopt beep
setopt print_exit_value
setopt no_hup

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

#prompt
autoload -U colors && colors
setopt prompt_subst
PROMPT='%{$fg[yellow]%}$(virtualenv_prompt_info)%{$fg[blue]%}%n@%m:%{$fg[green]%}${PWD/#$HOME/~}
%{$fg[blue]%}╰─$(git_prompt_info)%{$reset_color%} %#> '
RPROMPT='%{$fg[blue]%}[%D{%k:%M}]%{$reset_color%}'



#aliases
alias ext='extract'
alias ls='ls -GFlh'
alias ll='ls -GFlah'
subldiff() {
    git diff $* > /tmp/vardiff.diff && subl /tmp/vardiff.diff
}
alias vsubl="VIRTUAL_ENV=$PWD/venv subl $*"


#Vagrant aliases
alias vu="vagrant up"
alias vs="vagrant ssh"
alias vus="vagrant up && vagrant ssh"
alias vh="vagrant halt"
alias vst="vagrant global-status"
alias vr="vagrant reload"
alias vp="vagrant provision"


#vars
export BROWSER="google-chrome-stable"
export EDITOR="nano"
export VAGRANT_DEFAULT_PROVIDER="lxc"
export TERM="xterm-256color"
export PATH="$PATH:/usr/local/go/bin"

# Refresh prompt every 30 seconds
TMOUT=30
TRAPALRM() {
    if [ "$WIDGET" != "expand-or-complete" ]; then
        zle reset-prompt
    fi;
}

if [[ -f ~/.zshrc.local && -r ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

eval "$(direnv hook zsh)"
