#!/bin/bash
#Marc Burguera


read -p "Borrar (si/no): " resp
if [ $resp = "si" ]; then
    function borrar (){
        sudo groupdel strings
        sudo groupdel woodwind
        sudo groupdel metalwind
        sudo groupdel percussion
        sudo groupdel conductor
        sudo groupdel orchestra
        sudo userdel piccolo
        sudo userdel clarinet
        sudo userdel horn
        sudo userdel trunk
        sudo userdel fiddle
        sudo userdel viola
        sudo userdel cello
        sudo userdel doublebass
        sudo userdel battery
        sudo userdel xylophone
        sudo userdel conductor
    }
    borrar
else
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



    echo "COMPROBANDO GRUPOS"
    echo "..." 
    sleep 1
    echo ""
    cat /etc/group | grep strings || echo "Strings no existe"
    cat /etc/group | grep woodwind || echo "woodwind no existe"
    cat /etc/group | grep metalwind || echo "metalwind no existe"
    cat /etc/group | grep percussion || echo "Strings no existe"
    cat /etc/group | grep conductor || echo "Strings no existe"
    cat /etc/group | grep orchestra || echo "Strings no existe"
    echo ""
    echo "========================================================="
    echo "COMPROBANDO USUARIOS"
    echo "..." 
    sleep 1
    cat /etc/passwd | grep piccolo || echo "Piccolo no existe"
    cat /etc/passwd | grep clarinet || echo "Clarinet no existe"
    cat /etc/passwd | grep horn || echo "Horn no existe"
    cat /etc/passwd | grep trunk || echo "Trunk no existe"
    cat /etc/passwd | grep fiddle || echo "Fiddle no existe"
    cat /etc/passwd | grep viola || echo "Viola no existe"
    cat /etc/passwd | grep cello || echo "Cello no existe"
    cat /etc/passwd | grep doublebass || echo "Doublebass no existe"
    cat /etc/passwd | grep battery || echo "Battery no existe"
    cat /etc/passwd | grep xylophone || echo "Xylophone no existe"
    cat /etc/passwd | grep conductor || echo "Conductor no existe"

    echo "METALWIND"
    sudo usermod -a -G metalwind horn
    sudo usermod -a -G metalwind trunk
    sleep 1
    echo "[ HECHO ]"
    echo ""
    echo "STRINGS"
    sudo usermod -a -G string fiddle
    sudo usermod -a -G string viola
    sudo usermod -a -G string cello
    sudo usermod -a -G string doublebass
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
    sudo usermod -a -G percu  ssion battery 
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
fi




function comprobacion_usu(){
    cat /etc/passwd | grep piccolo
    cat /etc/passwd | grep clarinet
    cat /etc/passwd | grep horn
    cat /etc/passwd | grep trunk
    cat /etc/passwd | grep fiddle
    cat /etc/passwd | grep viola
}

function comprobacion_group(){
    cat /etc/group | grep strings
    cat /etc/group | grep woodwind
    cat /etc/group | grep metalwind
    cat /etc/group | grep percussion
    cat /etc/group | grep conductor
    cat /etc/group | grep orchestra
}





#comprobacion_usu
#comprobacion_group