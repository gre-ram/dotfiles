#!/bin/zsh
[ -z "$1" ] && echo "pdf file or DOI as argument." && exit

if [ -f "$1" ]; then
        doi=$(pdfinfo "$1" | grep -io "doi:.*") ||
        doi=$(pdftotext "$1" 2>/dev/null - | grep -io "doi:.*" -m 1) ||
        exit 1
else
        doi="$1"
fi
echo "---"
echo "key: [,]"
echo "---"
echo ""
echo "~~~~~{.bib}"
curl -s "https://api.crossref.org/works/$doi/transform/application/x-bibtex" -w "\\n"

echo ""
echo "~~~~~~"
