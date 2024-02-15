#!/bin/bash
#Marc Burguera

if [ $# -eq 2 ]; then
    usu=$(cat /etc/passwd | cut -d ":" -f1 | grep $1)
    if [ $1 = "$usu" ]; then
        echo "*Test 1 [Usuario existente]"
    elif [ $1 = "Administrador" ]; then
        echo "*Test 1 [The user admin exist]"
    else
        echo " * Error - The User given not exists"
        exit 1
    fi

    if [ $2 = "replenish" ]; then
	date=$(date +%Y%m%d-%H:%M)
        if ! [ -d /home/$1/SolarSystem ]; then
            read -p "El directorio no existe, desea crearlo? (si/no): " resp
            if [ $resp = "si" ]; then
                mkdir /home/$1/SolarSystem/
                mkdir /home/$1/SolarSystem/Mercury/
                mkdir /home/$1/SolarSystem/Venus/
                mkdir /home/$1/SolarSystem/Mars/
                mkdir /home/$1/SolarSystem/Jupiter/
                mkdir /home/$1/SolarSystem/Saturn/
                mkdir /home/$1/SolarSystem/Uranus/
                mkdir /home/$1/SolarSystem/Neptune/
                echo "..."
                sleep 2
                echo "Carpetas creadas"
                touch  /home/$1/SolarSystem/Mercury/control-planet.txt
                touch  /home/$1/SolarSystem/Venus/control-planet.txt
                touch  /home/$1/SolarSystem/Mars/control-planet.txt
                touch  /home/$1/SolarSystem/Jupiter/control-planet.txt
                touch  /home/$1/SolarSystem/Saturn/$1-$date.txt
                touch  /home/$1/SolarSystem/Uranus/control-planet.txt
                touch  /home/$1/SolarSystem/Neptune/control-planet.txt
                echo "..."
                sleep 2
                echo "Ficheros creados"
                echo "------ All is done -------"
            elif [ $resp = "no" ]; then
                exit 1
            fi
        else
            read -p "Directorio existente, quiere eliminarlo? (si/no): " resp2
            if [ $resp2 = "si" ]; then
                rm -rf /home/$1/SolarSystem
                echo "Directorio eliminado"
            elif [ $resp2 = "no" ]; then
                echo "Directorio no eliminado"
                exit 1
            fi
        fi
    fi

elif [ $# -eq 3 ]; then
    usu=$(cat /etc/passwd | cut -d ":" -f1 | grep $1)
    if [ $1 = "$usu" ]; then
        echo "Usuario existente"
    else
        echo " * Error - The User given not exists"
        exit 1
    fi
    if [ $2 = "test" ]; then
        ruta=$(echo $3 | grep /home/$1/SolarSystem/\*)
        #admin=$(cat /etc/group | grep $1 | grep sudo)
        if [ $3 = $ruta ]; then
            echo "La ruta es correcta--> "$3
            ls -Rl $3 | cut -d "" -f1,10-50 | sed '/^ *$/d' > permisos.csv
            cat permisos.csv | while read re; do
                perm=$(echo $re | cut -c2)
                if [ $perm = \- ]; then
                    echo $re "--> NO TIENE PERMISOS"
                fi
            done
        else
            echo "Ruta no valida, (debe ser absoluta o revisa la ruta si es correcta(Puede ser que el directorio no exista!!))"
        fi
    fi

    if [ $2 = "clean" ]; then
        ruta=$(echo $3 | grep /home/$1/SolarSystem/\*)
        if [ $3 = $ruta ]; then
            echo "$3-->Ruta valida"
            rm -rf $3
            echo "Directorio $3 [E L I M I N A D O]"
        else
            echo "Ruta no valida, (debe ser absoluta o revisa la ruta si es correcta (Puede ser que el directorio no exista))"
        fi
    fi
else
    echo "Pon dos argumentos!!! (3 en el caso de poner test o clean)"
fi
exit 0