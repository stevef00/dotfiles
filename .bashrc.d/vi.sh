if type nvim >/dev/null 2>&1; then
  alias vi=nvim
  export EDITOR=nvim
elif type vim >/dev/null 2>&1; then
  alias vi=vim
  export EDITOR=vim
else
  export EDITOR=vi
fi
