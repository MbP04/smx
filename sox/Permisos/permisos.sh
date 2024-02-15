#!/bin/bash
#Marc Burguera

per=$(ls -l /usr/bin | cut -d " " -f1 | grep s | wc -l)

echo "Hay un total de--> " $per
