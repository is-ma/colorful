function is_green (){
  if [[ -d ".git" ]]  # is there a .git/ directory here?
  then
    # is my working directory clean?
    if [ -z "$(git status --porcelain)" ]; then return 0; fi;  # green
    return -1;  # red
  fi
}

PS1="${bldred}\T${txtrst}${txtpur}|${bldylw}\H${txtpur}|${bldgrn}\w${txtpur}|"
PS1="$PS1${txtblu}\$(__git_ps1 "%s") \$(if is_green; then echo '\e[1;32m'; else echo '\e[1;31m'; fi)⧫${txtrst}\n"
export PS1
