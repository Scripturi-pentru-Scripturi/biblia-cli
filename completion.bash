_biblia-cli_comp() {
    COMPREPLY=( $(compgen -W "$1" -- ${word}) )
    if [[ ${#COMPREPLY[@]} == 1 && ${COMPREPLY[0]} == "--"*"=" ]]; then
        # If there's only one option, with =, then discard space
        complete -o nospace
    fi
}

_biblia-cli() {
    COMPREPLY=()
    complete +o default # Disable default to not deny completion, see: http://stackoverflow.com/a/19062943/1216348

    local word="${COMP_WORDS[COMP_CWORD]}"
    local prev="${COMP_WORDS[COMP_CWORD-1]}"

    case "${COMP_CWORD}" in
        1)
            if [[ $word == -* ]]; then
                _biblia-cli_comp '-l -W -h'
            else
                biblia-cli -l | while read b;
                    do echo ${b% *}
                done
            fi
            ;;
    esac
}
complete -F _biblia-cli biblia-cli
