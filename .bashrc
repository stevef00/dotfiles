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

if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi

# host or site specific stuff
if [ -f ~/.bashrc.local ]; then
  . ~/.bashrc.local
fi
