export EDITOR='nano'

limit coredumpsize 0

# rbenv
if (( $+commands[rbenv] )); then
  eval "$(rbenv init -)"
fi

# Load zplug
[[ -d ~/.zplug ]] || git clone https://github.com/zplug/zplug ~/.zplug
source ~/.zplug/init.zsh

# Load plugins
zplug "yous/vanilli.sh"
zplug "zsh-users/zsh-completions"
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "inutano/eggshausted"

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

# Install plugins if found any not installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load --verbose

# LS COLORS
export CLICOLOR=1

# local build tmux
tmux_lib_path="${HOME}/local/src/tmux-1.9a/libevent-2.0.21-stable/build/lib"
local_tmux_bin="${HOME}/local/bin/tmux"
if [ -d $tmux_lib_path ] && [ -f $local_tmux_bin ] ; then
  alias tmux='LD_LIBRARY_PATH=$tmux_lib_path $local_tmux_bin'
fi

# alias
alias x='exit'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias dirs='dirs -v'
alias n='nano -x'
alias nv='nano -xv'
alias tawk='awk -F "\t"'
