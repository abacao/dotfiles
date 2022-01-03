fzfgopass(){
  QUERY=$1
  if [ -z "$QUERY" ]; then
    QUERY=''
  fi
  gopass show -C \
    $(gopass ls --flat \
      | fzf -q "$QUERY" --preview "gopass show {}" \
    )
}

#source <(gopass completion zsh | awk 'n>=1 { print a[n%1] } { a[n++%1]=$0 }' | tail -n +2)
#compdef _gopass gopass
