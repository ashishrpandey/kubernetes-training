# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'


source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

