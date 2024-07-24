if type nvim >/dev/null 2>&1; then
  alias vi=nvim
  export EDITOR=nvim

  if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
    echo -n "Fetching 'junegunn/vim-plug' ... "
    if curl -sfLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; then
      echo "done"
      echo
      echo "Start nvim and run:"
      echo " :PlugInstall"
      echo
    else
      echo "failed."
    fi
  fi

elif type vim >/dev/null 2>&1; then
  alias vi=vim
  export EDITOR=vim
else
  export EDITOR=vi
fi
