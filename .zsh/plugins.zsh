source ~/.zsh/antigen.zsh
ADOTDIR=$HOME/.zsh

antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle git
antigen bundle pip
antigen bundle vagrant

antigen apply
