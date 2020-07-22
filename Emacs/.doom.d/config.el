(add-to-list 'default-frame-alist
             '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist
             '(ns-appearance . dark))

(global-auto-revert-mode t)

(add-hook 'org-mode-hook #'auto-fill-mode)

(setq user-full-name "Gregor Willenbrock"
      user-mail-address "g@wbrck.de")
(setq doom-theme 'doom-one)
(setq org-directory "~/org/")
(setq display-line-numbers-type t)

(setq
 doom-font (font-spec :family "SF Mono" :size 16)
 doom-big-font (font-spec :family "SF Mono" :size 32)
 doom-variable-pitch-font (font-spec :family "Avenir Next" :size 14)
 dart-format-on-save t
 mac-command-modifier 'meta
 projectile-project-search-path '("~/Code/")
 dired-dwim-target t)
