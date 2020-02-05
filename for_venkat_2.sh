#!/bin/bash

# appending filename manully at the end of each line
sed -i "s;$;     filename.txt;g" filename.txt

# appending filename at end of each file in current dir
for filename in `ls *.txt` ; do 
   sed -i "s;$;     $filename;g" $filename
done

