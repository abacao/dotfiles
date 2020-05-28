source_scripts(){
  for script in "$@"; do
    # skip non-executable snippets
    [ -x "$script" ] || continue
      # execute $script in the context of the current shell
      source $script
  done
}

source_scripts ~/.bashrc.d/{aliases,ansible,colors,completion,docker,env,fzf,git_color.sh,git-completion.bash,history,paths,prompt,vim}

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
