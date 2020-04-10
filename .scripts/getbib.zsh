#!/bin/zsh
[ -z "$1" ] && echo "pdf file or DOI as argument." && exit

if [ -f "$1" ]; then
        doi=$(pdfinfo "$1" | grep -io "doi:.*") ||
        doi=$(pdftotext "$1" - | pcregrep -M -o "\b(10[.][0-9]{4,}(?:[.][0-9]+)*/(?:(?![\"&\'<>])\S)+)\b" | head -n 1) ||
        exit 1
else
        doi="$1"
fi

bibo=$(curl -s "https://api.crossref.org/works/$doi/transform/application/x-bibtex" -w "\\n" | sed '$d')

echo ""
echo "~~~{.bib}"
echo $bibo,   
echo "    tags = {}"
echo "}"
echo "~~~"
