#!/bin/sh
# biblia-cli: Citește Biblia în linia de comandă
# Autor: Trag Date https://github.com/tragdate
# Licență: Dominiu public

SELF="$0"

get_data() {
  sed '1,/^#EOF$/d' < "$SELF" | tar xzf - -O "$1"
}

if [ -z "$PAGER" ]; then
  if command -v lee >/dev/null ; then
    PAGER="less"
  else
    PAGER="cat"
  fi
fi

show_help() {
  exec >&2
  echo "  biblia-cli: Citește Biblia în linia de comandă"
  echo "  Uz: $(basename "$0") [flag] [referință...]"
  echo   
  echo "  Flaguri:"
  echo "    -h, Ajutor: Afișează acest mesaj de ajutor"
  echo "    -l, Listează: Afișează lista de cărți"
  echo "    -W, Linii largi: Afișează textul fără împărțirea în linii"
  echo
  echo "  Referințe:"
  echo "    <Carte>"
  echo "      Cărțile pot fi specificate în mai multe moduri:"
  echo "        Numele complet al cărții (ex: Facerea)"
  echo "        Abrevierea cărții (ex: Fa)"
  echo 
  echo "    <Carte>:<Capitol>"
  echo "      Un capitol întreg dintr-o carte (ex: Facerea:1)"
  echo 
  echo "    <Carte>:<Capitol>:<Verset/e>"
  echo "      Un verset dintr-un capitol dintr-o carte (ex: Facerea:1:1) sau mai multe versete (ex: Facerea:1:1-3)"
  echo
  echo "    <Carte>:<Capitol>-<Capitol>"
  echo "      Mai multe capitole dintr-o carte (ex: Facerea:1-3)"
  echo 
  echo "    <Carte>:<Capitol>:<Verset>-<Verset>"
  echo "      Mai multe versete dintr-un capitol dintr-o carte (ex: Facerea:1:2-3)"
  echo
  echo "    <Carte>:<Capitol>:<Verset>-<Capitol>:<Verset>"
  echo "      Mai multe versete din mai multe capitole dintr-o carte (ex: Facerea:1:1-3:2)"
  echo 
  echo "  Căutare:"
  echo "    Căutarea se poate face prin adăugarea flagului / urmat de un cuvânt cheie"
  echo "    Ex: $(basename "$0") /Adam"
  echo 
  echo "    Căutarea se poate face și în interiorul unei cărți"
  echo "    Ex: $(basename "$0") Facerea /Adam"
  echo
  echo "    Căutarea se poate face și în interiorul unui capitol"
  echo "    Ex: $(basename "$0") Facerea:1 /Adam"
  echo 
  exit 2
}
while [ $# -gt 0 ]; do
  isFlag=0
  firstChar="${1%"${1#?}"}"
  if [ "$firstChar" = "-" ]; then
    isFlag=1
  fi

  if [ "$1" = "--" ]; then
    shift
    break
  elif [ "$1" = "-l" ]; then
    # Listează toate numele cărților cu abrevierile lor
    get_data data/biblia.tsv | awk -v cmd=list "$(get_data data/biblia.awk)"
    exit
  elif [ "$1" = "-W" ]; then
    export BIBLIA_NOLINEWRAP=1
    shift
  elif [ "$1" = "-h" ] || [ "$isFlag" -eq 1 ]; then
    show_help
  else
    break
  fi
done

cols=$(tput cols 2>/dev/null)
if [ $? -eq 0 ]; then
  export BIBLIA_MAX_WIDTH="$cols"
fi

if [ $# -eq 0 ]; then
  if [ ! -t 0 ]; then
    show_help
  fi

        # Interactive mode
        while true; do
          printf "biblia> "
          if ! read -r ref; then
            break
          fi
          get_data data/biblia.tsv | awk -v cmd=ref -v ref="$ref" "$(get_data data/biblia.awk)" | ${PAGER}
        done
        exit 0
fi

get_data data/biblia.tsv | awk -v cmd=ref -v ref="$*" "$(get_data data/biblia.awk)" | ${PAGER}
