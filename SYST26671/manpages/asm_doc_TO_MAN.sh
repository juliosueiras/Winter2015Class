#!/bin/sh

while read p; do
    name=$p

    touch "$name"
    touch temp_work_file

    echo > "$name"
    file="$name"

    echo ".TH $name 7 \"17 Feb 2015\" \"8086 ASM\" \"Sheridan College Comp Arch 8086 Instrcution's set\"" >> "$file"

    echo ".SH INSTRUCTION" >> "$file"

    echo "$name" >> "$file"

    echo ".SH OPERANDS">> "$file"

    sed -e '1,/^<\/TD>.*/d' < ../8086asm_man/"$file" | sed -e '1,/^<\/TD>.*/d' > temp_work_file

    sed -n '1,/^<TD>.*/p' < temp_work_file | sed -e 's/<[A-Za-z\/][^>]*>//g' >> "$file"
    sed -e '1,/^<TD>.*/d' < temp_work_file > finalprepare

    echo ".SH DESCRIPTION" >> "$file"

    sed -e 's/<[A-Za-z\/][^>]*>//g' < finalprepare >> "$file"


    # modifies files by toggling a randomly chosen bit.>> $file
    # .SH OPTIONS>> $file
    # .TP>> $file
    # .BR \-n ", " \-\-bits =\fIBITS\fR>> $file
    # Set the number of bits to modify.>> $file
    # Default is one bit.>> $file
    
done<"$1"
