#!/bin/sh
for i in $( ls ./test); do
    filena="$i" 
    cat -A "$i" | sed -e 's/[\^M]\$//' > ./test/"$filena"; 
done
