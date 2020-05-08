function is_green (){
  if [[ -d ".git" ]]  # is there a .git/ directory here?
  then

    # is my working directory clean?
    if [ -z "$(git status --untracked-files=no --porcelain)" ]; then
      return 0;  # green
    else
      return -1;  # red
    fi

  fi
}

export PS1="${txtblu}[ ${bldred}\T${txtrst}${txtblu} | ${bldylw}\u@\H ${txtblu}| ${bldgrn}\w${txtblu} ] ${txtblk}\n\$(if is_green; then echo '\e[42m'; else echo '\e[41m'; fi)\$(__git_ps1 "%s")${txtrst} > "
