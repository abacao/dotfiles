if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
eval $(/bin/brew shellenv)
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
