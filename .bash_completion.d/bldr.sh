_bldr_complete() {
    local cur prev
    local cword=$COMP_CWORD
    local words=("${COMP_WORDS[@]}")

    cur=${words[$cword]}
    prev=${words[$((cword-1))]}

    # Define subcommands and global options
    local subcommands="add bnr boot changeconsole changeeth changehosttype changeinstalldev changeos changeraidlevel changeselinux destroy firmware help local reinstall rename rescue show"
    local global_opts="--bldr-url -h --help"

    # Options for the 'add' subcommand
    local add_opts="--arch --alias --ethernet --os --raid-level --console --boot-from --selinux-mode --puppet-environment --host-type --install-dev --usrvg1-size --force"

    # Completion logic
    if [ $cword -eq 1 ]; then
        # Completing the first argument after `bldr`:
        # Offer subcommands and global options
        COMPREPLY=( $(compgen -W "${subcommands} ${global_opts}" -- "${cur}") )
    else
        # We have at least one subcommand chosen
        case "${words[1]}" in
            add)
                # 'bldr add' takes options and then a HOSTNAME.
                # If the current word looks like an option, complete from add_opts and global_opts.
                if [[ "${cur}" == --* ]]; then
                    COMPREPLY=( $(compgen -W "${add_opts} ${global_opts}" -- "${cur}") )
                else
                    # If not starting with '--', let user type a HOSTNAME freely.
                    # Still show options as a hint if they press tab with no partial word.
                    COMPREPLY=( $(compgen -W "${add_opts} ${global_opts}" -- "${cur}") )
                fi
                ;;
            destroy)
                # 'bldr destroy' requires a HOSTNAME. We'll use the ~/sw/bin/bldr-list output.
                # If the current word starts with '-', maybe user wants global opts,
                # but the usage suggests global opts go before the command, so we’ll skip that case.

                # Complete hostnames from bldr-list
                local hostnames
                hostnames="$(~/sw/bin/bldr-list 2>/dev/null)"
                COMPREPLY=( $(compgen -W "${hostnames}" -- "${cur}") )
                ;;
            *)
                # For other subcommands, no special completion yet.
                COMPREPLY=()
                ;;
        esac
    fi
}

complete -F _bldr_complete bldr