#!/bin/bash
#Marc Burguera

read -p "Quiere crear lo grupos y ususarios necesarios? (si/no): " resp

if [ $resp = "si" ]; then
    function usuarios(){
        sudo useradd piccolo
        sudo useradd clarinet
        sudo useradd horn
        sudo useradd trunk
        sudo useradd fiddle
        sudo useradd viola
        sudo useradd cello
        sudo useradd doublebass
        sudo useradd battery
        sudo useradd xylophone
        sudo useradd conductor
    }

    function grupos(){
        sudo groupadd strings
        sudo groupadd woodwind
        sudo groupadd metalwind
        sudo groupadd percussion
        sudo groupadd conductor
        sudo groupadd orchestra
    }
    usuarios
    grupos

    read -p "Quieres comprobar si se ha creado correctamente? (si/no); " resp2

    if [ $resp2 = "si" ]; then
        echo ""
        echo "COMPROBANDO GRUPOS"
        echo "..." 
        sleep 1
        echo ""
        cat /etc/group | grep strings | cut -d ":" -f1 || echo "Strings no existe"
        cat /etc/group | grep woodwind | cut -d ":" -f1 || echo "woodwind no existe"
        cat /etc/group | grep metalwind | cut -d ":" -f1 || echo "metalwind no existe"
        cat /etc/group | grep percussion | cut -d ":" -f1 || echo "Strings no existe"
        cat /etc/group | grep conductor | cut -d ":" -f1 || echo "Strings no existe"
        cat /etc/group | grep orchestra | cut -d ":" -f1 || echo "Strings no existe"
        echo ""
        echo "========================================================="
        echo "COMPROBANDO USUARIOS"
        echo "..." 
        sleep 1
        cat /etc/passwd | grep piccolo | cut -d ":" -f1 || echo "Piccolo no existe"
        cat /etc/passwd | grep clarinet | cut -d ":" -f1 || echo "Clarinet no existe"
        cat /etc/passwd | grep horn | cut -d ":" -f1 || echo "Horn no existe"
        cat /etc/passwd | grep trunk | cut -d ":" -f1 || echo "Trunk no existe"
        cat /etc/passwd | grep fiddle | cut -d ":" -f1 || echo "Fiddle no existe"
        cat /etc/passwd | grep viola | cut -d ":" -f1 || echo "Viola no existe"
        cat /etc/passwd | grep cello | cut -d ":" -f1 || echo "Cello no existe"
        cat /etc/passwd | grep doublebass | cut -d ":" -f1 || echo "Doublebass no existe"
        cat /etc/passwd | grep battery | cut -d ":" -f1 || echo "Battery no existe"
        cat /etc/passwd | grep xylophone | cut -d ":" -f1 || echo "Xylophone no existe"
        cat /etc/passwd | grep conductor | cut -d ":" -f1 || echo "Conductor no existe"

        read -p "Quieres añadir los usuarios corresapondientes a sus grupos?' (si/no): " resp
        if [ $resp = "si" ]; then
            echo "METALWIND"
            sudo usermod -a -G metalwind horn
            sudo usermod -a -G metalwind trunk
            sleep 1
            echo "[ HECHO ]"
            echo ""
            echo "STRINGS"
            sudo usermod -a -G strings fiddle
            sudo usermod -a -G strings viola
            sudo usermod -a -G strings cello
            sudo usermod -a -G strings doublebass
            sleep 1
            echo "[ HECHO ]"
            echo ""
            echo "WOODWIND"
            sudo usermod -a -G woodwind piccolo 
            sudo usermod -a -G woodwind clarinet
            sleep 1
            echo "[ HECHO ]"
            echo ""
            echo "PERCUSSION"
            sudo usermod -a -G percussion battery 
            sudo usermod -a -G percussion xylophone
            sleep 1
            echo "[ HECHO ]"
            echo ""
            echo "CONDUCTOR"
            sudo usermod -a -G conductor conductor
            sleep 1
            echo "[ HECHO ]"
            echo ""
            echo "ORCHESTRA"
            sudo usermod -a -G orchestra piccolo
            sudo usermod -a -G orchestra clarinet
            sudo usermod -a -G orchestra horn
            sudo usermod -a -G orchestra trunk
            sudo usermod -a -G orchestra fiddle
            sudo usermod -a -G orchestra viola
            sudo usermod -a -G orchestra cello
            sudo usermod -a -G orchestra doublebass
            sudo usermod -a -G orchestra battery
            sudo usermod -a -G orchestra xylophone
            sudo usermod -a -G orchestra conductor
            sleep 1
            echo "[ HECHO ]"

            if ! [ -d /srv/sox ]; then
                echo "Procedemos a crear los directorios pedidos..."
                mkdir /srv/sox/
                mkdir /srv/sox/TheGreatGateOfKiev
                mkdir /srv/sox/BlueDanube
                mkdir /srv/sox/NewWorlSymphonie
                mkdir /srv/sox/TheJazzSuite
                sleep 1
                echo ""
                echo "[ HECHO ]"
                rc=0

                if [ $rc -eq 0 ]; then
                    echo "[ CREANDO FICHEROS [TheGreatGateOfKiev]]"
                    touch /srv/sox/TheGreatGateOfKiev/fiddle.txt
                    touch /srv/sox/TheGreatGateOfKiev/piccolo.txt
                    touch /srv/sox/TheGreatGateOfKiev/clarinet.txt
                    touch /srv/sox/TheGreatGateOfKiev/horn.txt
                    touch /srv/sox/TheGreatGateOfKiev/trunk.txt
                    touch /srv/sox/TheGreatGateOfKiev/viola.txt
                    touch /srv/sox/TheGreatGateOfKiev/cello.txt
                    touch /srv/sox/TheGreatGateOfKiev/doublebass.txt
                    touch /srv/sox/TheGreatGateOfKiev/battery.txt
                    touch /srv/sox/TheGreatGateOfKiev/xylophone.txt
                    touch /srv/sox/TheGreatGateOfKiev/conductor.txt

                    echo "[ CREANDO FICHEROS [BlueDanube]]"
                    touch /srv/sox/BlueDanube/fiddle.txt
                    touch /srv/sox/BlueDanube/piccolo.txt
                    touch /srv/sox/BlueDanube/clarinet.txt
                    touch /srv/sox/BlueDanube/horn.txt
                    touch /srv/sox/BlueDanube/trunk.txt
                    touch /srv/sox/BlueDanube/viola.txt
                    touch /srv/sox/BlueDanube/cello.txt
                    touch /srv/sox/BlueDanube/doublebass.txt
                    touch /srv/sox/BlueDanube/battery.txt
                    touch /srv/sox/BlueDanube/xylophone.txt
                    touch /srv/sox/BlueDanube/conductor.txt

                    echo "[ CREANDO FICHEROS [NewWorldSymphonie]]"
                    touch /srv/sox/NewWorldSymphonie/fiddle.txt
                    touch /srv/sox/NewWorldSymphonie/piccolo.txt
                    touch /srv/sox/NewWorldSymphonie/clarinet.txt
                    touch /srv/sox/NewWorldSymphonie/horn.txt
                    touch /srv/sox/NewWorldSymphonie/trunk.txt
                    touch /srv/sox/NewWorldSymphonie/viola.txt
                    touch /srv/sox/NewWorldSymphonie/cello.txt
                    touch /srv/sox/NewWorldSymphonie/doublebass.txt
                    touch /srv/sox/NewWorldSymphonie/battery.txt
                    touch /srv/sox/NewWorldSymphonie/xylophone.txt
                    touch /srv/sox/NewWorldSymphonie/conductor.txt

                    echo "[ CREANDO FICHEROS [TheJazzSuite]]"
                    touch /srv/sox/TheJazzSuite/fiddle.txt
                    touch /srv/sox/TheJazzSuite/piccolo.txt
                    touch /srv/sox/TheJazzSuite/clarinet.txt
                    touch /srv/sox/TheJazzSuite/horn.txt
                    touch /srv/sox/TheJazzSuite/trunk.txt
                    touch /srv/sox/TheJazzSuite/viola.txt
                    touch /srv/sox/TheJazzSuite/cello.txt
                    touch /srv/sox/TheJazzSuite/doublebass.txt
                    touch /srv/sox/TheJazzSuite/battery.txt
                    touch /srv/sox/TheJazzSuite/xylophone.txt
                    touch /srv/sox/TheJazzSuite/conductor.txt
                    rc=0
                elif [ $rc -eq 0 ]; then 
                    echo "[DANDO PERMISOS A ARCHIVOS FIDDLE]"
                    sleep 1
                    chown fiddle /srv/sox/TheJazzSuite/fiddle.txt
                    chown fiddle /srv/sox/TheGreatGateOfKiev/fiddle.txt
                    chown fiddle /srv/sox/NewWorldSymphonie/fiddle.txt
                    chown fiddle /srv/sox/BlueDanube/fiddle.txt

                    echo "[DANDO PERMISOS A ARCHIVOS PICCOLO]"
                    sleep 1
                    chown piccolo /srv/sox/TheJazzSuite/piccolo.txt
                    chown piccolo /srv/sox/TheGreatGateOfKiev/piccolo.txt
                    chown piccolo /srv/sox/NewWorldSymphonie/piccolo.txt
                    chown piccolo /srv/sox/BlueDanube/piccolo.txt
                    echo "[DANDO PERMISOS A ARCHIVOS CLARINET]"
                    sleep 1
                    chown clarinet /srv/sox/TheJazzSuite/clarinet.txt
                    chown clarinet /srv/sox/TheGreatGateOfKiev/clarinet.txt
                    chown clarinet /srv/sox/NewWorldSymphonie/clarinet.txt
                    chown fiddle /srv/sox/BlueDanube/clarinet.txt
                    echo "[DANDO PERMISOS A ARCHIVOS HORN]"
                    sleep 1
                    chown horn /srv/sox/TheJazzSuite/horn.txt
                    chown horn /srv/sox/TheGreatGateOfKiev/horn.txt
                    chown horn /srv/sox/NewWorldSymphonie/horn.txt
                    chown horn /srv/sox/BlueDanube/horn.txt
                    echo "[DANDO PERMISOS A ARCHIVOS TRUNK]"
                    sleep 1
                    chown trunk /srv/sox/TheJazzSuite/ftrunk.txt
                    chown trunk /srv/sox/TheGreatGateOfKiev/trunk.txt
                    chown trunk /srv/sox/NewWorldSymphonie/trunk.txt
                    chown trunk /srv/sox/BlueDanube/trunk.txt

                    echo "[DANDO PERMISOS A ARCHIVOS VIOLA]"
                    sleep 1
                    chown viola /srv/sox/TheJazzSuite/viola.txt
                    chown viola /srv/sox/TheGreatGateOfKiev/viola.txt
                    chown viola /srv/sox/NewWorldSymphonie/viola.txt
                    chown viola /srv/sox/BlueDanube/viola.txt
                    echo "[DANDO PERMISOS A ARCHIVOS CELLO]"
                    sleep 1
                    chown cello /srv/sox/TheJazzSuite/cello.txt
                    chown cello /srv/sox/TheGreatGateOfKiev/cello.txt
                    chown cello /srv/sox/NewWorldSymphonie/cello.txt
                    chown cello /srv/sox/BlueDanube/cello.txt
                    echo "[DANDO PERMISOS A ARCHIVOS DOUBLEBASS]"
                    sleep 1
                    chown doublebass /srv/sox/TheJazzSuite/doublebass.txt
                    chown doublebass /srv/sox/TheGreatGateOfKiev/doublebass.txt
                    chown doublebass /srv/sox/NewWorldSymphonie/doublebass.txt
                    chown doublebass /srv/sox/BlueDanube/doublebass.txt
                    echo "[DANDO PERMISOS A ARCHIVOS BATTERY]"
                    sleep 1
                    chown battery /srv/sox/TheJazzSuite/battery.txt
                    chown battery /srv/sox/TheGreatGateOfKiev/battery.txt
                    chown battery /srv/sox/NewWorldSymphonie/battery.txt
                    chown battery /srv/sox/BlueDanube/battery.txt
                    echo "[DANDO PERMISOS A ARCHIVOS XYLOPHONE]"
                    sleep 1
                    chown xylophone /srv/sox/TheJazzSuite/xylophone.txt
                    chown xylophone /srv/sox/TheGreatGateOfKiev/xylophone.txt
                    chown xylophone /srv/sox/NewWorldSymphonie/xylophone.txt
                    chown xylophone /srv/sox/BlueDanube/xylophone.txt
                    echo "[DANDO PERMISOS A ARCHIVOS XYLOPHONE]"
                    sleep 1
                    chown xylophone /srv/sox/TheJazzSuite/xylophone.txt
                    chown xylophone /srv/sox/TheGreatGateOfKiev/xylophone.txt
                    chown xylophone /srv/sox/NewWorldSymphonie/xylophone.txt
                    chown xylophone /srv/sox/BlueDanube/xylophone.txt
                    echo "[DANDO PERMISOS A ARCHIVOS CONDUCTOR]"
                    sleep 1
                    chown conductor /srv/sox/TheJazzSuite/conductor.txt
                    chown conductor /srv/sox/TheGreatGateOfKiev/conductor.txt
                    chown conductor /srv/sox/NewWorldSymphonie/conductor.txt
                    chown conductor /srv/sox/BlueDanube/conductor.txt
                fi
            else
                echo "[ Directorios ya creados ]"
            fi

        elif [ $resp2 = "no" ]; then
            exit 1
        fi

    elif [ $resp2 = "no" ]; then
        exit 1
    fi

elif [ $resp = "no" ]; then
    exit 1
elif ! [ $resp = "si" -a $resp = "no" ]; then
    echo "Pon [ si ] o [ no ]"
fi
exit 0