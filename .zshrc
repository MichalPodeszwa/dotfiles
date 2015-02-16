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
    gitignore
    vagrant
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-completions src
    zsh-users/zsh-history-substring-search
EOB

antigen apply

zstyle ":completion:*:commands" rehash 1

unsetopt beep
setopt print_exit_value
setopt no_hup

#prompt
autoload -U colors && colors
setopt prompt_subst
PROMPT='%{$fg[blue]%}$(virtualenv_prompt_info)%n@%m:%{$fg[green]%}${PWD/#$HOME/~}
%{$fg[blue]%}╰─$(git_prompt_info)%{$reset_color%} %#> '
RPROMPT=''



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

export LANG="pl_PL.UTF-8"
export LC_all="pl_PL.UTF-8"


# enable keychain. ALWAYS LAST
if (( $+commands[keychain] )) ; then
    eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
fi