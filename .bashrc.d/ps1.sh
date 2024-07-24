function ps1_parse_git_branch {
      local branch="$(git branch --show-current 2>/dev/null || : )"
      if [ -n "$branch" ]; then
        branch="($branch)"
      fi
      echo -e "$branch"
}

function _fg_color() {
  color_no=$1
  echo "\e[38;5;${color_no}m"
}

_prompt_reset='\[\e[0m\]'

case "$HOSTNAME" in
  "tablet")
    _prompt_color_default="65" # green
    ;;
  *)
    _prompt_color_default="75" # light blue
    ;;
esac
_prompt_color_git="97"   # light purple
_prompt_color_root="240" # light grey
if type git >/dev/null 2>&1; then
  PS1="\[$(_fg_color ${_prompt_color_git})\]\$(ps1_parse_git_branch)\[$(_fg_color ${_prompt_color_default})\]\u@\h \w \[$(_fg_color ${_prompt_color_root})\]\$${_prompt_reset} "
else
  PS1="[\u@\h \w] \$ "
fi
