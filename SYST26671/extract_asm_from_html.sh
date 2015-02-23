#!/bin/sh

while read p; do

    sed -n /\<A\ NAME=\""$p"\".*\>/,/^\<A\ HREF=\"\#top1\"/p < ./emu003r3/doc/8086_instruction_set.html  > ./8086asm_man/"$p"

    sed -i '$ d' ./8086asm_man/"$p" 

done <"$1"

#lynx -dump -nolist http://www.php.net/manual/en/print/function.$1.php | sed -n /^$1/,/^.*User\ Contributed\ Notes/p | grep -v ‘User\ Contributed\ Notes’
