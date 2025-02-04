if type bat >/dev/null 2>&1; then
  export MANROFFOPT="-c"
  export MANPAGER="sh -c 'col -bx | bat -l Manpage -p'"
fi
