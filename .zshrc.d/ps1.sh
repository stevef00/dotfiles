setopt PROMPT_SUBST

show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV)) "
  fi
}

parse_git_branch() {
      local branch="$(git branch --show-current 2>/dev/null || : )"
      if [ -n "$branch" ]; then
        branch="[$branch] "
      fi
      echo -e "$branch"
}

# https://robotmoon.com/zsh-prompt-generator/

PS1='%{%F{151}%}$(show_virtual_env)'
PS1=$PS1'%{%F{111}%}$(parse_git_branch)'
PS1=$PS1'%{%F{141}%}%n@%m %1~ %{%f%}$ '
