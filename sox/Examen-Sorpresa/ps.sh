#!/bin/bash
#Marc Burguera


time=$(ps -ex | tr -s " " | cut -d " " -f5 | cut -d "E" -f2)
min=$(ps -ex | tr -s " " | cut -d ":" -f2)

echo -e $time > time.csv

for line in $(cat time.csv); do
    min=$(echo $line | cut -d ":" -f2)
    hora=$(echo $line | cut -d ":" -f1)
    min2=$(expr $min2 + $min)
    hora2=$(expr $hora2 + $hora)
    
    if [ $min2 -gt 59 ]; then
        let min2=$min2-60
        let hora2=$hora2+1
    fi

    if [ $hora2 -gt 23 ]; then
        dia=0
        let dia=$dia+1
        let hora2=$hora2-24
    fi
done

echo $dia
echo "En total hay --> "$min2 "min" $hora2 "horas" $dia "dia"

exit 0
