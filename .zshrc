alias ls="ls -G"

if [ -d $HOME/Library/Python/3.8/bin ]; then
  PATH=$HOME/Library/Python/3.8/bin:$PATH
fi

if [ -d /opt/homebrew/bin ]; then
  PATH=/opt/homebrew/bin:$PATH
fi

if type nvim >/dev/null 2>&1; then
  alias vi=nvim
fi

export MANWIDTH=70

precmd() {
  case $TERM in
    screen*)
    PROMPT_COMMAND="echo -ne '\ek$USER@${HOST%%.*}\e\\'"
    eval "$PROMPT_COMMAND"
    ;;
  esac
}

if [ -d ~/.zshrc.d ]; then
  for rc in ~/.zshrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
