#!/bin/sh

for i in $( ls ../8086asm_man); do
    name=$(echo "$i")

    touch "$name"
    echo > "$name"
    file="$name"
    echo ".TH $name 1 \"17 Feb 2015\" Linux \"Sheridan College Comp Arch 8086 Instrcution's set\"" >> $file

    echo ".SH INSTRUCTION" >> $file

    echo "$name" >> $file

    echo ".SH OPERAND">> $file

    echo ".SH DESCRIPTION">> $file


    # modifies files by toggling a randomly chosen bit.>> $file
    # .SH OPTIONS>> $file
    # .TP>> $file
    # .BR \-n ", " \-\-bits =\fIBITS\fR>> $file
    # Set the number of bits to modify.>> $file
    # Default is one bit.>> $file
done
