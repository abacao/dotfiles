#INSTALLATION
### brew install fzf
#
# To install useful key bindings and fuzzy completion:
### $(brew --prefix)/opt/fzf/install

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/bin* ]]; then
  export PATH="$PATH:/usr/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */usr/share/man* && -d "/usr/share/man" ]]; then
  export MANPATH="$MANPATH:/usr/share/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/share/bash-completion/completions/fzf" 2> /dev/null

# Key bindings
# ------------
#source "/usr/local/opt/fzf/shell/key-bindings.bash"
