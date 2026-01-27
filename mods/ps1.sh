# is there a .git/ directory here?
function is_git(){
  [ -d .git ] && return 0       # current dir
  [ -d ../.git ] && return 0    # parent dir
  [ -d ../../.git ] && return 0 # grandparent dir
  return -1
}

function is_red(){
  is_git && ! [ -z "$(git status --porcelain)" ] && return 0 || return -1
}
function is_green(){
  is_git && [ -z "$(git status --porcelain)" ] && return 0 || return -1
}
function is_green_and_online(){
  is_green && grep -q "origin/master" <(git log --oneline --decorate -n1) && return 0 || return -1
}
function is_green_and_online_v2(){
  is_green && grep -q "origin/main" <(git log --oneline --decorate -n1) && return 0 || return -1
}

prompt="${txtred}\t"            # hour (red)
prompt="$prompt${txtpur}|"      # pipe (purple)
prompt="$prompt${txtylw}\H"     # host (yellow)
prompt="$prompt${txtpur}|"      # pipe (purple)
prompt="$prompt${txtgrn}\w"     # path (green)

# git
prompt="$prompt\$(if is_git; then echo '\e[0;35m|'; fi)"                   # pipe (purple)
prompt="$prompt\$(if is_git; then echo -n '\e[0;34m'; echo \$(__git_ps1 '%s'); fi)"  # branch (blue)
prompt="$prompt\$(if is_red; then echo -n '\e[0;31m ✗'; fi)"               # red mark
prompt="$prompt\$(if is_green; then echo -n '\e[0;32m ✓'; fi)"             # green mark
prompt="$prompt\$(if is_green_and_online; then echo -n '\e[0;32m✓'; fi)"   # green mark (double)
prompt="$prompt\$(if is_green_and_online_v2; then echo -n '\e[0;32m✓'; fi)"   # green mark (double)

export PS1="$prompt${txtrst}\n"

