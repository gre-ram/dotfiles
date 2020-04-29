#!/bin/zsh 


NOTES=$(find . | grep -i .md)
touch notes.md

echo "$NOTES" | while read -r note
do
    pcregrep -M -v "^~.*|^@.*|(^\t\w+\s=\s.*)|^\s\s\s\s\w+\s=\s.*|^}" "$note" >> notes.md
done


