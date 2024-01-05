if [ ! -z "$PS1" -a -f $HOME/.bashrc ]; then
  . $HOME/.bashrc
fi

# host or site specific stuff
if [ -f ~/.profile.local ]; then
  . ~/.profile.local
fi

