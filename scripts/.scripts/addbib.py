#!/usr/bin/python
# -*- coding: utf-8 -*-
# Pandoc filter that grabs the BibTeX code block from each note file
# and then adds it to a master bib file main.bib
# filter by W. Caleb McDaniel.
	
from pandocfilters import toJSONFilter, CodeBlock

def bibtex(key, value, format, meta):
	if key != 'CodeBlock':
		return []
	else:
		format, s = value
		with open('/tmp/chunk.bib', 'w') as bibfile:
			bibfile.write(s)
		
if __name__ == "__main__":
	toJSONFilter(bibtex)
