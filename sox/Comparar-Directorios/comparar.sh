#!/bin/bash
#Marc Burguera

echo "==== VAS A COMPARAR DOS DIRECTORIOS ===="
echo " "

read -p "Ruta de origen--> " origen
read -p "Ruta de destino--> " destino


diff -r $origen $destino

