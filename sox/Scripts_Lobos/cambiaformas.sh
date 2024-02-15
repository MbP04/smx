#!/bin/bash
#Marc Burguera


let luna=($RANDOM%5)+1
if [ $luna -eq 3 ]; then
    echo "==== ERES HUMANO (LUNA = 3)====="
    echo " "
    echo "Cambiando de forma de HUMANO a GLABRO..."
    sleep 3
    echo "[ COMPLETADO ]"
    echo "Cambiando de forma de HGLABRO a CRINOS"
    sleep 5
    echo "[ COMPLETADO ]"
fi
if [ $# -eq 0 ]; then
    echo "Por favor, introduzca 2 argumentos"
    exit 1
elif [ $# -eq 2 ]; then
    if [ $1 = "humano" ]; then
        sleep 2
        echo "==== ERES HUMANO ====="
        echo " "
        if [ $2 = "glabro" -o $2 = "crinos" -o $2 = "hispo" -o $2 = "lupus" ]; then
            echo "Cambiando de forma de HUMANO a GLABRO..."
            sleep 3
            echo "[ COMPLETADO ]"
            if [ $2 = "crinos" -o $2 = "hispo" -o $2 = "lupus" ]; then
                echo "Cambiando de forma de GLABRO a CRINOS..."
                sleep 5
                echo "[ COMPLETADO ]"
                if [ $2 = "hispo" -o $2 = "lupus" ]; then
                    echo "Cambiando de forma de CRINOS a HISPO..."
                    sleep 4
                    echo "[ COMPLETADO ]"
                    if [ $2 = "lupus" ]; then
                        echo "Cambiando de forma de HISPO a LUPUS"
                        sleep 1
                        echo "[ COMPLETADO ]"
                    fi
                fi
            fi
        fi

    elif [ $1 = "glabro" ]; then
        echo "==== ERES GLABRO ====="
        echo " "
        if [ $2 = "crinos" -o $2 = "hispo" -o $2 = "lupus" ]; then
            echo "Cambiando de forma de GLABRO a CRINOS..."
            sleep 5
            echo "[ COMPLETADO ]"
            if [ $2 = "hispo" -o $2 = "lupus" ]; then
                echo "Cambiando de forma de CRINOS a HISPO..."
                sleep 4
                echo "[ COMPLETADO ]"
                if [ $2 = "lupus" ]; then
                    echo "Cambiando de forma de HISPO a LUPUS"
                    sleep 1
                    echo "[ COMPLETADO ]"
                fi
            fi
        fi

    elif [ $1 = "crinos" ]; then
        echo "==== ERES CRINO ====="
        echo " "
        if [ $2 = "hispo" -o $2 = "lupus" ]; then
            echo "Cambiando de forma de CRINOS a HISPO..."
            sleep 4
            echo "[ COMPLETADO ]"
            if [ $2 = "lupus" ]; then
                echo "Cambiando de forma de HISPO a LUPUS"
                sleep 1
                echo "[ COMPLETADO ]"
            fi
        fi

    elif [ $1 = "hispo" ]; then
        echo "==== ERES HISPO ====="
        echo " "
        if [ $2 = "lupus" ]; then
            echo "Cambiando de forma de HISPO a LUPUS"
            sleep 1
            echo "[ COMPLETADO ]"
        fi

    elif [ $1 = "lupus" ]; then
        echo "==== ERES LUPUS ====="
        echo " "
        echo "Lo siento pero no puede empezar con la forma LUPUS (Es la última fase)"
    fi
fi

exit 0


