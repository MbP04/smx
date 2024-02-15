#!/bin/bash
#Marc Burguera

if [ $# -eq 1 ]; then
    rc=0
    echo $1 | grep '^\./' || rc=1
    if [ $rc -eq 0 ]; then
        echo "Ruta Relativa"
    else
        echo "No hay ruta relativa"
    fi

elif [ $# -eq 0 -o $# -gt 1 ]; then
    echo "Introduce 1 argumento !!!"

fi
exit 0