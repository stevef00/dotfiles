# Bash completion for facswitch (no dependencies)

_facswitch_completions() {
    local cur prev
    # Get the current word to complete
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    if [[ $COMP_CWORD -eq 1 ]]; then
        # Completing NAME
        COMPREPLY=( $(compgen -W "$(fachelper list)" -- "$cur") )
    elif [[ $COMP_CWORD -eq 2 ]]; then
        # Completing VERSION
        local name="${COMP_WORDS[1]}"
        COMPREPLY=( $(compgen -W "$(fachelper versions "$name")" -- "$cur") )
    fi
}

# Register the completion function
complete -F _facswitch_completions facswitch
