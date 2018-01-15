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

# Load completions provided by Debian packages
if [[ -d "/usr/share/zsh/vendor-completions" ]]; then
  fpath=(/usr/share/zsh/vendor-completions $fpath)
fi

# Read completion scripts from ~/.config/zsh/completions/*
COMPLETIONS="$HOME/.config/zsh/completions"
if [ -d "$COMPLETIONS" ]; then
  fpath=($COMPLETIONS $fpath)
fi

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
