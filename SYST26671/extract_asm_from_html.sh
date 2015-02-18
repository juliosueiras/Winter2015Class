#!/bin/sh

while read p; do
    echo $p

    touch $p

    cat emu003r3/doc/8086_instruction_set.html | sed -n /\<A\ NAME=\"$p\".*\>/,/^\<A\ HREF=\"#top1\"/p > tempfile

    sed -e 's/<[a-zA-Z\/][^>]*>//g' tempfile > $p
    mv $p ./8086asm_man/$p
    rm tempfile

done <$1

#lynx -dump -nolist http://www.php.net/manual/en/print/function.$1.php | sed -n /^$1/,/^.*User\ Contributed\ Notes/p | grep -v ‘User\ Contributed\ Notes’
