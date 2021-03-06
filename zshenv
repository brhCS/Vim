[[ -f ~/.zshenv_local.zsh ]] && . ~/.zshenv_local.zsh

skip_global_compinit=1

# Don't nice background processes
unsetopt BG_NICE

## ============================================================================
##                           Environment Variables
## ============================================================================
export GTEST_COLOR=yes

# Use emacsclient on my desktop/laptop; vim on cloud nodes, etc.
if [[ "$(hostname)" = brh* ]]; then
    export EDITOR=emacsclient
    export VISUAL=emacsclient
else
    export EDITOR=vim
    export VISUAL=vim
fi

# Reduce delay to 0.2 seconds for switching to normal mode with ESC
export KEYTIMEOUT=20

PATH=~/.nix-profile/bin:~/bin_local:$PATH
PATH=~/bin:$PATH
PATH=$PATH:~/.local/bin
PATH=$PATH:/bin
PATH=$PATH:/sbin
PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/bin
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/usr/sbin

# Enable full support for Unicode explicitly
export LANG=en_US.UTF-8

# Spacemacs errors if it looks for an env var and it isn't set
export MANPATH=""
export GOPATH=""

export GTAGSLABEL=pygments

export GPG=gpg2

export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export FZF_COMPLETION_TRIGGER='~~'

if uname -a | grep -q "NixOS" ; then
    export IS_NIXOS=1
fi

pathDeduplicate() {
    export PATH="$(echo "$PATH" |
        awk 'BEGIN{RS=":";} \
            {sub(sprintf("%c$",10),"");if(A[$0]){}else{A[$0]=1;printf(((NR==1)?"":":")$0)}}' \
        )";
}

pathDeduplicate
