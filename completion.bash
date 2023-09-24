if [ -n "$ZSH_VERSION" ]; then
    autoload -U +X bashcompinit && bashcompinit
fi

_biblia-cli() {
local word=${COMP_WORDS[COMP_CWORD]}
local prev=${COMP_WORDS[COMP_CWORD-1]}

case "${COMP_CWORD}" in
    1)
        if [[ $word == -* ]]; then
            COMPREPLY=( $(compgen -W '-l -W -h' -- ${word}) )
        else
            COMPREPLY=( $(biblia-cli -l | awk '{print $1}') )
        fi
        ;;
esac
}

complete -F _biblia-cli biblia-cli

