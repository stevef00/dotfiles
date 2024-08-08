if type fzf >/dev/null 2>&1; then
  eval "$(fzf --bash)"
  export FZF_CTRL_R_OPTS="--exact"
fi
