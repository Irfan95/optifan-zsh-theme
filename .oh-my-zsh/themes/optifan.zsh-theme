# Prompt Substitution
setopt PROMPT_SUBST

# Prepare the module
autoload -U colors 

# Load the colors module
colors

# Git branch function
git_branch() {
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || \
  branch=$(git rev-parse --short HEAD 2>/dev/null)

  if [[ -n $branch ]]; then
    echo " %F{magenta}(${branch})%f"
  fi
}

# Left prompt (line 1)
PROMPT='%F{white}[ %F{cyan}%~%F{white} ]%f$(git_branch)'

# Right prompt (line 1)
RPROMPT='%F{white}[ %F{yellow}%*%F{white} ]%f'

# Line 2 prompt (arrow)
PROMPT+=$'\n %F{green}↳%f '