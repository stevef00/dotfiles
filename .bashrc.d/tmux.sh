if type tmux >/dev/null 2>&1; then
  alias t='tmux attach -d >/dev/null 2>&1 || tmux new'
fi
