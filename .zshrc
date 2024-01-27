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

precmd() {
  case $TERM in
    screen*)
    PROMPT_COMMAND="echo -ne '\ek$USER@${HOST%%.*}\e\\'"
    eval "$PROMPT_COMMAND"
    ;;
  esac
}
