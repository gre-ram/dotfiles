(setq user-full-name "Gregor Willenbrock"
      user-mail-address "g@wbrck.de")
(setq doom-theme 'doom-one)
(setq display-line-numbers-type 'relative)

(setq org-directory "/Users/gregor/Documents/ORG/")
(setq! +biblio-pdf-library-dir "/Users/gregor/Documents/ORG/pdfs/"
       +biblio-default-bibliography-files '("/Users/gregor/Documents/ORG/main.bib")
       +biblio-notes-path "/Users/gregor/Documents/ORG/roam/")

(setq! bibtex-autokey-name-year-separator "_"
       bibtex-autokey-year-title-separator "_"
       bibtex-autokey-titlewords 1
       bibtex-autokey-year-length 4
       bibtex-autokey-edit-before-use nil
       bibtex-autokey-additional-names nil
       bibtex-autokey-titleword-ignore '("A" "An" "On" "The" "Eine" "Ein" "Der" "Die" "Das")
       bibtex-autokey-titlewords-stretch 0
       bibtex-autokey-titleword-length "all"
       biblio-bibtex-use-autokey t
       bibtex-comma-after-last-field t
       org-ref-completion-library 'org-ref-ivy-cite)


(setq orb-preformat-keywords
      '("citekey" "title" "url" "author-or-editor" "keywords" "file")
      orb-process-file-field t
      orb-file-field-extensions "pdf")

(setq orb-templates
      '(("r" "ref" plain (function org-roam-capture--get-point)
         ""
         :file-name "Konspekte/${citekey}"
         :head "#+TITLE: Konspekt von ${citekey}\n#+ROAM_KEY: ${ref}

* Konspekt für ${citekey}
:PROPERTIES:
:Custom_ID: ${citekey}
:AUTHOR: ${author-or-editor}
:NOTER_DOCUMENT: ${file}
:NOTER_PAGE:
:END:")))
