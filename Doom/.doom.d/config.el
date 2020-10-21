(setq user-full-name "Gregor Willenbrock"
      user-mail-address "g@wbrck.de")
(setq doom-theme 'doom-one)
(setq display-line-numbers-type 'relative)


(setq
   myKonspekte (concat (getenv "HOME") "/Documents/ORG/Konspekte")
   myBibfile (concat (getenv "HOME") "/Documents/ORG/main.bib")
   myPdfs (concat (getenv "HOME") "/Documents/ORG/pdfs")
   myNotes (concat (getenv "HOME") "/Documents/ORG/org-notes")
   org-directory myNotes
   org-roam-directory myNotes)




(setq   bibtex-autokey-year-length 4
	bibtex-autokey-name-year-separator "-"
	bibtex-autokey-year-title-separator "-"
	bibtex-autokey-titleword-separator "-"
	bibtex-autokey-titlewords 1
	bibtex-autokey-titlewords-stretch 1
	bibtex-autokey-titleword-length 20)
