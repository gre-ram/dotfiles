#!/bin/sh

> $HOME/main.bib

# Find all the notes whose name is a string followed by four digits,
# then send that file through the getbibs.py pandoc filter.


PAGES=$(find $HOME/Documents/Sci-Bib/ -print| grep -i .md)

echo "$PAGES" | while read -r page
do
	pandoc --filter=$HOME/.scripts/addbib.py -t markdown $page | sed '/^`/d' | sed '/^[[:space:]]*$/d' >> $HOME/main.bib 
done

