if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
#export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
#export PATH="$HOME/.tfenv/bin:$PATH"
#export PATH="$HOME/.tfenv/bin:$PATH"
