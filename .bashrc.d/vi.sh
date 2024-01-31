if type nvim >/dev/null 2>&1; then
  alias vi=nvim
  export EDITOR=nvim
else
  alias vi=vim
  export EDITOR=vim
fi
