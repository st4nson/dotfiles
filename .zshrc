# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/st4nson/.oh-my-zsh

#ZSH_THEME="honukai"
ZSH_THEME="muse"

COMPLETION_WAITING_DOTS="true"

plugins=(git wd vi-mode)

source $ZSH/oh-my-zsh.sh

## User configuration

# The next line updates PATH for the Google Cloud SDK.
if [ -f /home/st4nson/.local/share/google-cloud-sdk/path.zsh.inc ]; then
  source '/home/st4nson/.local/share/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /home/st4nson/.local/share/google-cloud-sdk/completion.zsh.inc ]; then
  source '/home/st4nson/.local/share/google-cloud-sdk/completion.zsh.inc'
fi

## Golang
export GOPATH=$HOME/golang
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin

# Vi-mode indicator
MODE_INDICATOR=" %{$fg_bold[blue]%}%{$reset_color%}"

# 10ms for key timeout
KEYTIMEOUT=1

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

## Aliases
alias tmux="tmux -2"
alias vagrant_hostkey_cleanup="for port in {2200..2250}; do; ssh-keygen -f /home/st4nson/.ssh/known_hosts -R \[127.0.0.1\]:\$port;done;"

alias iptlist="sudo /sbin/iptables -L -n -v --line-numbers"
alias iptlistin="sudo /sbin/iptables -L INPUT -n -v --line-numbers"
alias iptlistout="sudo /sbin/iptables -L OUTPUT -n -v --line-numbers"
alias iptlistfw="sudo /sbin/iptables -L FORWARD -n -v --line-numbers"

export FZF_TMUX=1
export FZF_DEFAULT_OPTS="--border"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## Custom zsh functions
source ~/.zsh_functions

# Autocompletion for k8s stuff
source <(kubectl completion zsh)
source <(helm completion zsh)

RPS1='$(kubectx_prompt_info)'
