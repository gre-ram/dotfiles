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
    infos=$(pcregrep -M -v "^~.*|^@.*|(^\t\w+\s=\s.*)|^\s\s\s\s\w+\s=\s.*|^}" "$old_info_md"".md")
    tags=$(pcregrep -M "(?<=\stitle = {).*?(?=(})" "$old_info_md"".md")
}

make_file() {
    ins=$(echo $bib | pcregrep -M -o "((^\s\s\s\s)|(^\t)).*$")
    echo "" > "$key.md"
    echo "~~~{.bib}" >> "$key.md"
    echo "@"$art"{"$key"," >> "$key.md"
    echo $ins"," >> "$key.md"
    echo "    tags = {"$tags"}" >> "$key.md"
    echo "}" >> "$key.md"
    echo "" >> "$key.md"
    echo "~~~" >> "$key.md"
    echo $infos >> "$key.md"
}

if [ -f "$1" ]; then
        doi=$(pdfinfo "$1" | grep -io "doi:.*") ||
        doi=$(pdftotext "$1" - | pcregrep -M -o "\b(10[.][0-9]{4,}(?:[.][0-9]+)*/(?:(?![\"&\'<>])\S)+)\b" | head -n 1) ||
        pre_file_name=$(echo $1)
        old_info_md=$(echo $pre_file_name | pcregrep -o "^.*(?=\.)")
        get_bib
        get_old_info
        make_file
        mv "$pre_file_name" "$key"".pdf"
        rm "$old_info_md"".md"
        exit 1
else
        doi="$1"
        get_bib
        old_info_md=$(echo "$key"".md")
        get_old_info
        rm "$old_info_md"".md"
        make_file
fi
