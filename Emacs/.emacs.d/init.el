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
(set-frame-font "Source Code Pro-14" nil t)

(setq mac-allow-anti-aliasing t)

(use-package powerline
    :ensure t
    :config
    (powerline-center-evil-theme)
    )

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
  :ensure t ;; install the evil package if not installed
  :config ;; tweak evil after loading it
  (evil-mode 1))

