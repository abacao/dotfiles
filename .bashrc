source_scripts(){
  for script in "$@"; do
    # skip non-executable snippets
    [ -x "$script" ] || continue
      # execute $script in the context of the current shell
      source $script
  done
}

source_scripts ~/.bashrc.d/{aliases,ansible,brew,brew_bashcomplete,colors,completion,docker,env,fzf,git_color.sh,git-completion.bash,history,paths,prompt,vim}
