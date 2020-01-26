#!/bin/sh

> $HOME/main.bib

# Find all the notes whose name is a string followed by four digits,
# then send that file through the getbibs.py pandoc filter.

CUR=$(pwd)

PAGES=$(basename -s .md -a "$CUR"/*.md | grep '^[a-z]\+[0-9]\{4\}')

echo "$PAGES" | while read -r page
do
	pandoc --filter=$HOME/.scripts/getbibs.py -t markdown "$CUR"/"$page".md >> $HOME/main.bib 
done
