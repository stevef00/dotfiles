if [ -z "$SSH_AUTH_SOCK" ]; then
  # don't run keychain if $SSH_AUTH_SOCK is set - this should handle the
  # forwarded agent case where  there is no 'local' ssh-agent process
  # running and we don't want to start one as it won't have our keys loaded.
  if type keychain >/dev/null 2>&1; then
    eval $(keychain --eval)
  fi
fi
