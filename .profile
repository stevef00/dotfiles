if [ -d ~/.profile.d ]; then
  for rc in ~/.profile.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi

if [ ! -z "$PS1" -a -f $HOME/.bashrc ]; then
  . $HOME/.bashrc
fi
