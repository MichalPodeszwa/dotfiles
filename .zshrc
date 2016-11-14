HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt hist_expire_dups_first
setopt inc_append_history
setopt share_history

source ~/.zsh/antigen.zsh
ADOTDIR=$HOME/.zsh

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
    virtualenvwrapper
    gitignore
    vagrant
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-completions src
    history-substring-search
EOB

antigen bundle unixorn/autoupdate-antigen.zshplugin

antigen apply

zstyle ":completion:*:commands" rehash 1
unsetopt beep
setopt print_exit_value
setopt no_hup

#prompt
autoload -U colors && colors
setopt prompt_subst
PROMPT='%{$fg[yellow]%}$(virtualenv_prompt_info)%{$fg[blue]%}%n@%m:%{$fg[green]%}${PWD/#$HOME/~}
%{$fg[blue]%}╰─$(git_prompt_info)%{$reset_color%} %#> '
RPROMPT='%{$fg[blue]%}[%D{%k:%M:%S}]%{$reset_color%}'



#aliases
alias ext='extract'
alias ls='ls -Flh --color=auto'
alias ll='ls -Flah --color=auto'
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
export BROWSER="firefox"
export EDITOR="nano"
export VAGRANT_DEFAULT_PROVIDER="lxc"
export TERM="xterm-256color"

export NVM_DIR="/home/vessel/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Refresh prompt every second
TMOUT=1
TRAPALRM() {
    if [ "$WIDGET" != "expand-or-complete" ]; then
        zle reset-prompt
    fi;
}

export ANDROID_HOME=~/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
