# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# stuff for interactive shells

# make manpages more readable/printable
export MANWIDTH=70

# host or site specific stuff
if [ -f ~/.bashrc.local ]; then
  . ~/.bashrc.local
fi
