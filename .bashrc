# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# stuff for interactive shells

# source global config if it exists
case $SHELL in
  *bash)
    if [ -f /etc/bashrc ]; then
      # gnome-terminal on fedora needs this
      source /etc/bashrc
    fi
    ;;
esac

HISTSIZE='1000'
HISTFILESIZE='10000'
HISTTIMEFORMAT='[%D %T] '
export HISTSIZE HISTFILESIZE HISTTIMEFORMAT

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

if [ -d ~/.bash_completion.d ]; then
  for f in ~/.bash_completion.d/*.sh; do
    source $f
  done
fi

# host or site specific stuff
if [ -f ~/.bashrc.local ]; then
  . ~/.bashrc.local
fi
