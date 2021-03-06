(require 'package)
  (add-to-list
   'package-archives
   '("MELPA" . "https://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)



(setq inhibit-splash-screen t
      initial-scratch-message nil)

;;(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;;(set-default-font "Source Code Pro")
(set-frame-font "SF Mono-18" nil t)

(setq mac-allow-anti-aliasing t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package nord-theme
    :ensure t
    :demand)


(use-package git-gutter
  :ensure git-gutter-fringe
  :hook ((prog-mode . git-gutter-mode)
         (org-mode . git-gutter-mode)))

(use-package all-the-icons
  :after font-lock+
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package org
  :ensure t)

(use-package org-ref
  :ensure t)

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil org-ref which-key all-the-icons git-gutter-fringe nord-theme powerline use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
