export EDITOR='nano'
export PATH=$HOME/local/bin:$PATH

limit coredumpsize 0

# rbenv
[ -d $HOME/.rbenv/bin ] && export PATH="$HOME/.rbenv/bin:$PATH"
[ -f $HOME/.rbenv/bin/rbenv ] && eval "$(rbenv init -)"

# Load zplug
[[ -d ~/.zplug ]] || git clone https://github.com/zplug/zplug ~/.zplug
source ~/.zplug/init.zsh

# Load plugins
zplug "yous/vanilli.sh"
zplug "inutano/eggshausted"

zplug "plugins/git",   from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh

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

if zplug check "zsh-users/zsh-history-substring-search"; then
  bindkey -M emacs '^P' history-substring-search-up
  bindkey -M emacs '^N' history-substring-search-down
fi

# LS COLORS
export CLICOLOR=1

# for local install tmux on ddbj
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
alias dockr='docker run --rm -it -v $(pwd):/work -w /work'
