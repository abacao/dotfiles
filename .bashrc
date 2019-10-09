source_scripts(){
  for script in "$@"; do
    # skip non-executable snippets
    [ -x "$script" ] || continue
      # execute $script in the context of the current shell
      source $script
  done
}

source_scripts ~/.bashrc.d/{aliases,ansible,completion,colors,docker,env,fzf,git_color.sh,heroku,history,paths,prompt,vim}
source <(gopass completion bash)

export HOME=/home/abacao
export TERMINAL=terminator

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
