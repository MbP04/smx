#!/bin/bash
#Marc Burguera

if [ $# -eq 1 ]; then
    rc=0
    echo $1 | grep '^/' || rc=1
    if [ $rc -eq 0 ]; then
        echo "Ruta Absoluta"
	if [ -d $1 ]; then
	    echo "El directorio existe"
	elif [ -f $1 ]; then
	    echo "El fichero existe"
	    escritura=$(ls -l $1 | cut -c3)
	    ejecucion=$(ls -l $1 | cut -c4)
	    lectura=$(ls -l $1 | cut -c2)
	    if [ $escritura = "w" ]; then
	        echo "--> Tiene permisos de escritura"
	    else
		echo "--> No tiene permisos de escritura"
	    fi
	    if [ $ejecucion = "x" ]; then
	        echo "--> Tiene permisos de ejecucion"
	    else
		echo "--> No tiene permisos de ejecucion"
            fi
	    if [ $lectura = "r" ]; then
	        echo "--> Tiene permisos de lectura"
	    else
	    	echo "--> No tiene permisos de lectura"
	    fi
	else
	    echo "Lo que pones en el argumento no existe"
	fi
    else
        echo "No hay ruta relativa"
    fi

elif [ $# -eq 0 -o $# -gt 1 ]; then
    echo "Introduce 1 argumento !!!"
fi

exit 0
