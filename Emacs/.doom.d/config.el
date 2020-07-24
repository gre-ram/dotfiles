(add-to-list 'default-frame-alist
             '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist
             '(ns-appearance . dark))

(setq user-full-name "Gregor Willenbrock"
      user-mail-address "g@wbrck.de")
(setq doom-theme 'doom-one)
(setq org-directory "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org")
(setq display-line-numbers-type t)

(setq
 doom-font (font-spec :family "SF Mono" :size 16)
 doom-big-font (font-spec :family "SF Mono" :size 32)
 doom-variable-pitch-font (font-spec :family "Avenir Next" :size 14)
 dart-format-on-save t
 mac-command-modifier 'meta
 projectile-project-search-path '("~/Code/")
 dired-dwim-target t
 )

(use-package! org-ref
  :config
  (setq reftex-default-bibliography '("~/main.bib"))
  (setq org-ref-completion-library 'org-ref-ivy-cite))

(use-package! citeproc-org
  :config
  (citeproc-org-setup))

(after! lsp-python-ms
  (set-lsp-priority! 'mspyls 1))

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
