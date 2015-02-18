#!/bin/sh
for i in $( ls 8086asm_man ); do 
    tail -n +11 8086asm_man/"$i" | tee 8086asm_man/"$i";
done
