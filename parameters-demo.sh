#!/bin/bash

POSITIONAL=()
while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
      -e|--extension)
        EXTENSION="$2"
        shift # past arguement
        shift # past value
        ;;
      -s|--searchpath)
        SEARCHPATH="$2"
        shift # past arguement
        shift # past value
        ;;
      -l|--lib)
        LIBPATH="$2"
        shift # past arguement
        shift # past value
        ;;
      --default)
        DEFAULT=YES
        shift # past arguement
        ;;
      *)    # unknown option
        POSITIONAL+=("$1") # save it in an array for later
        shift # past arguement
        ;;
    esac
done

set -- "${POSITIONAL[@]}" # restore positional parameters

echo "FILE EXTENSION  = ${EXTENSION}"
echo "SEARCH PATH     = ${SEARCHPATH}"
echo "LIBRARY PATH    = ${LIBPATH}"
echo "DEFAULT         = ${DEFAULT}"
echo "Number files in SEARCH PATH with EXTENSION:" $(ls -1 "${SEARCHPATH}"/*."${EXTENSION}" | wc -l)
if [[ -n $1 ]]; then
    echo "Last line of file specified as non-opt/last arguement:"
    tail -1 "$1"
fi
