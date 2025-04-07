_rake() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    local prev="${COMP_WORDS[COMP_CWORD-1]}"

    # Tell bash to include : as part of the word
    COMP_WORDBREAKS=${COMP_WORDBREAKS//:}

    # Find Rakefile by traversing up directories
    local dir="$PWD"
    local rakefile=""
    while [[ "$dir" != "/" ]]; do
        if [[ -f "$dir/Rakefile" ]]; then
            rakefile="$dir/Rakefile"
            break
        fi
        dir="$(dirname "$dir")"
    done

    # If Rakefile found, get tasks from rake -T
    if [[ -n "$rakefile" ]]; then
        # Parse rake -T output to get task names, preserving colons
        local tasks=$(rake -T | awk '{print $2}' | tr '\n' ' ')
        COMPREPLY=($(compgen -W "$tasks" -- "$cur"))
    fi

    return 0
}

complete -F _rake rake
