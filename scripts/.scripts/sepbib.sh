#!/bin/sh
[ -z  "$1" ] && echo ".bib file as argument!" && exit

pcregrep -M -o "(?s)^@(.*?)^\}" "$1"| while read -r line
do
   if [[ $line =~ ^@.* ]]
   then
       key=$(echo $line | pcregrep -M -o "(?<=\{).*(?=,)")
       touch "$key"".md"
       echo $line >> "$key"".md"
   elif [[ $line =~ ^\} ]]
   then
       touch "$key"".md"
       echo $line >> "$key"".md"

   else
       touch "$key"".md"
       echo $line >> "$key"".md"
   fi
done

