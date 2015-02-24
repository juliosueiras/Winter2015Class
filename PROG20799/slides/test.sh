unzip -qc "$1" ppt/slides/slide*.xml | grep -oP '(?<=\<a:t\>).*?(?=\</a:t\>)'
