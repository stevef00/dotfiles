_cons_completion() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # Get list of hosts from cons --list command
    # Using command substitution and tr to convert spaces to newlines
    hosts=$(/usr/local/sbin/cons --list | tr -s ' ' '\n')

    # All available options
    opts="--terminate --status --cycle --reset --on --off --bios --pxe --show-port --list --show --bmc-info --firmware --ping"

    # If previous word is cons, complete with both options and hosts
    if [[ ${prev} == "cons" ]]; then
        COMPREPLY=( $(compgen -W "${opts} ${hosts}" -- ${cur}) )
        return 0
    fi

    # If previous word is an option that requires a hostname
    case "${prev}" in
        --terminate|--status|--cycle|--reset|--on|--off|--bios|--pxe|--show-port|--show|--bmc-info|--firmware|--ping)
            COMPREPLY=( $(compgen -W "${hosts}" -- ${cur}) )
            return 0
            ;;
    esac

    # Otherwise, just complete with hosts
    COMPREPLY=( $(compgen -W "${hosts}" -- ${cur}) )
}

complete -F _cons_completion cons 