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
            bnr|destroy|local|reinstall|rescue)
                # These subcommands require just a HOSTNAME. Use bldr-list to get them.
                local hostnames
                hostnames="$(~/sw/bin/bldr-list 2>/dev/null)"
                COMPREPLY=( $(compgen -W "${hostnames}" -- "${cur}") )
                ;;
            changeconsole)
                # 'bldr changeconsole' takes a HOSTNAME and then a CONSOLE selection.
                if [ $cword -eq 2 ]; then
                    # First argument after 'changeconsole': complete with hostnames
                    local hostnames
                    hostnames="$(~/sw/bin/bldr-list 2>/dev/null)"
                    COMPREPLY=( $(compgen -W "${hostnames}" -- "${cur}") )
                elif [ $cword -eq 3 ]; then
                    # Second argument after 'changeconsole': complete with console options
                    local console_options="ttyS0 ttyS1"
                    COMPREPLY=( $(compgen -W "${console_options}" -- "${cur}") )
                fi
                ;;
            changeos)
                # 'bldr changeos' takes a HOSTNAME and then an OS selection.
                if [ $cword -eq 2 ]; then
                    # First argument after 'changeos': complete with hostnames
                    local hostnames
                    hostnames="$(~/sw/bin/bldr-list 2>/dev/null)"
                    COMPREPLY=( $(compgen -W "${hostnames}" -- "${cur}") )
                elif [ $cword -eq 3 ]; then
                    # Second argument after 'changeos': complete with OS options
                    local os_options="almalinux8 centos7 ubuntu-20_04"
                    COMPREPLY=( $(compgen -W "${os_options}" -- "${cur}") )
                fi
                ;;

            *)
                # For other subcommands, no special completion yet.
                COMPREPLY=()
                ;;
        esac
    fi
}

complete -F _bldr_complete bldr