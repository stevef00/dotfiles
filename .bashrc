# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# stuff for interactive shells

case $TERM in
  screen*)
    PROMPT_COMMAND='printf "\033k%s@%s\033\\" "${USER}" "${HOSTNAME%%.*}"'
    ;;
esac

# make manpages more readable/printable
export MANWIDTH=70

# host or site specific stuff
if [ -f ~/.bashrc.local ]; then
  . ~/.bashrc.local
fi
