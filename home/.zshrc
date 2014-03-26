# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sunrise"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(cabal colored-man git mvn nvm rvm tmux vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Lets me cd into any directory immediately under the given paths
# without typing the full path.
cdpath=(. $HOME $HOME/projects)
# If an unmatched glob is used, just use it as literal text instead of giving an error.
# Helpful for my lazy fingers considering how often I use scp:
#   scp suchandsuch.host:files/* ./
# gives an error if nomatch is set.
unsetopt nomatch
# Wait until the next prompt is printed to say whether a job is finished.
unsetopt notify

# Exporting options for less breaks `git diff`.  Not sure why.
unset LESS

# Use Solarized theme colors for directory listings
[[ -s "$HOME/.dircolors" ]] && eval `dircolors "$HOME/.dircolors"`

# That's right
export EDITOR=vim
# And again
export VISUAL=$EDITOR

# Source configurations from ~/.config/zsh/conf.d/*
CONFIGS="$HOME/.config/zsh/conf.d"
if [ -d "$CONFIGS" ]; then
  CONFIGFILES=$(run-parts --list $CONFIGS)
  if [ -n "$CONFIGFILES" ]; then
    for CONFIGFILE in ${(f)CONFIGFILES}; do
      source $CONFIGFILE
    done
  fi
fi

# Load completions provided by Debian pacakages
if [[ -d "/usr/share/zsh/vendor-completions" ]]; then
  fpath=(/usr/share/zsh/vendor-completions $fpath)
fi

# Read completion scripts from ~/.config/zsh/completions/*
COMPLETIONS="$HOME/.config/zsh/completions"
if [ -d "$COMPLETIONS" ]; then
  COMPLETIONFILES=$(run-parts --list $COMPLETIONS)
  if [ -n "$COMPLETIONFILES" ]; then
    for COMPLETIONFILE in ${(f)COMPLETIONFILES}; do
      fpath=($COMPLETIONFILE $fpath)
    done
  fi
fi
