settitle() {
    printf '\033k%s\033\\' "$1"
}

bash_prompt_command() {
    settitle "${HOSTNAME%%.*}"
}

# Rename the window in Screen-compatible terminals.
case "$TERM" in
    screen*|tmux*)
        PROMPT_COMMAND+=(bash_prompt_command)
        ;;
esac
