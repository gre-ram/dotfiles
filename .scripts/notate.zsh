#!/bin/zsh
[ -z "$1" ] && echo "pdf file or DOI as argument." && exit

get_bib() {
    bib=$(curl -s "https://api.crossref.org/works/$doi/transform/application/x-bibtex" -w "\\n" | sed '$d')
    title=$(echo $bib | pcregrep -M -o "(?<=\stitle = {)\w+")
    author="$(echo $bib | pcregrep -M -o "(?<=\sauthor = {).*?((?=})|(?=and))" | pcregrep  -M -o "\w+\s*$" | pcregrep -M -o "\S+")"
    year=$(echo $bib | pcregrep -M -o "((?<=year\s=\s)\d\d\d\d)|((?<=date\s=\s)\d\d\d\d)")
    key=$(echo $author"_"$title"_"$year)
    art=$(echo $bib | pcregrep -M -o "(?<=@).*?(?={)")
}

get_old_info() {
    infos=$(pcregrep -M -v "^~.*|^@.*|(^\t\w+\s=\s.*)|^\s\s\s\s\w+\s=\s.*|^}" "${1}")
    tags=$(pcregrep -M -o "(?<=\stags = {).*?(?=(}))" "${1}")
}

make_file() {
    ins=$(echo $bib | pcregrep -M -o "((^\s\s\s\s)|(^\t)).*$")
    echo "" > "$key.md"
    echo "~~~{.bib}" >> "$key.md"
    echo "@"$art"{"$key"," >> "$key.md"
    echo $ins"," >> "$key.md"
    echo "    tags = {"$tags"}" >> "$key.md"
    echo "}" >> "$key.md"
    echo "~~~" >> "$key.md"
    echo $infos >> "$key.md"
}

check_file() {
    find ~/Desktop/. | grep -i -q ${1}
    if [ $? -eq 0 ]
    then
            old_file=$(find ~/Desktop/. | grep -i ${1})
            get_old_info $old_file
            mv $old_file "old""$key"".txt"
            make_file
            if [ -z ${old_pdf+x} ]; then : ; else mv "$old_pdf" "$key"".pdf" ; fi
            exit 1
    else
            :   
    fi
}

if [ -f "$1" ]; then
        doi=$(pdfinfo "$1" | grep -io "doi:.*") ||
        doi=$(pdftotext "$1" - | pcregrep -M -o "\b(10[.][0-9]{4,}(?:[.][0-9]+)*/(?:(?![\"&\'<>])\S)+)\b" | head -n 1) ||
        exit 1
        old_pdf=$(echo $1)
        old_info_md=$(echo $old_pdf | pcregrep -o "^.*(?=\.)")
        get_bib
        check_file "$old_info_md"".md"
        check_file "$key"".md"
        make_file
        mv "$old_pdf" "$key"".pdf" 
        exit 1
else
        doi="$1"
        get_bib
        check_file "$key"".md"
        make_file
fi
