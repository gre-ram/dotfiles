(setq custom-file "~/.emacs-custom")
(if (file-exists-p custom-file)
  (load custom-file))

(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(use-package auto-compile
             :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

(org-babel-load-file "~/dotfiles/Emacs/configuration.org")
