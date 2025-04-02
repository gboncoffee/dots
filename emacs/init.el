(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;
;; Appearance.
;;

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(setq-default display-line-numbers-width 3)
(add-hook 'prog-mode-hook
	  (lambda ()
	    (display-line-numbers-mode t)
	    (display-fill-column-indicator-mode t)))

(set-face-attribute 'default nil :font "Geist Mono-12")
(set-frame-font "Geist Mono-12" nil t)

(setq scroll-step 1)
(setq scroll-conservatively 100000)
(setq-default show-trailing-whitespace t)

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :init
  (load-theme 'sanityinc-tomorrow-night t))

(use-package rainbow-mode
  :ensure t
  :init
  (rainbow-mode t))

(use-package rainbow-delimiters
  :ensure t
  :init
  (rainbow-delimiters-mode))

;;
;; Interface.
;;

(defalias 'yes-or-no-p 'y-or-n-p)
(setopt use-short-anwsers t)
(windmove-default-keybindings 'meta)

(use-package ido-completing-read+
  :ensure t
  :init
  (ido-mode t)
  (ido-everywhere t)
  (ido-ubiquitous-mode t))

(use-package amx
  :ensure t
  :init
  (amx-mode t))

(use-package eldoc-box
  :ensure t)

(setq make-backup-files nil)

(setq-default compile-command "")

(use-package magit
  :ensure t
  :init
  (global-set-key (kbd "C-c C-g") #'magit))

(use-package forge
  :ensure t
  :after magit)

(use-package diff-hl
  :ensure t
  :init
  (global-diff-hl-mode))

(defun shell-below ()
  (interactive)
  (split-window-below)
  (windmove-down)
  (shell))

(global-set-key (kbd "C-c C-c") #'compile)
(global-set-key (kbd "C-c C-d") #'xref-find-definitions)
(global-set-key (kbd "C-c C-r") #'eglot-rename)
(global-set-key (kbd "C-c C-?") #'xref-find-references)
(global-set-key (kbd "C-c C-b") #'flymake-show-buffer-diagnostics)
(global-set-key (kbd "C-c C-t") #'shell-below)

(add-hook 'find-file-hook
	  (lambda () (setq default-directory command-line-default-directory)))

;;
;; Editing.
;;

(electric-indent-mode t)
(electric-pair-mode t)
(add-hook 'text-mode-hook
	  (lambda ()
	    (auto-fill-mode t)))
(delete-selection-mode t)

(use-package multiple-cursors
  :ensure t
  :init
  (global-set-key (kbd "C-S-c") #'mc/edit-lines)
  (global-set-key (kbd "C->") #'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") #'mc/mark-previous-like-this))

(use-package editorconfig
  :ensure t
  :init
  (editorconfig-mode t))

;;
;; Langs.
;;

(add-hook 'eglot-managed-mode-hook
	  (lambda ()
	    (eglot-inlay-hints-mode -1)
	    (eldoc-box-hover-at-point-mode t)
	    (add-hook 'after-save-hook #'eglot-format nil t)))

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (prettify-symbols-mode t)))

(use-package go-mode
  :ensure t
  :init
  (add-hook 'go-mode-hook #'eglot-ensure)
  (setq tab-width 4)
  (setq indent-tabs-mode t))

(setq-default c-basic-offset 4)
(setq-default c-default-style "bsd")
(defun c-configs ()
  (eglot-ensure)
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  ;; I hate c-mode for using C-c.
  (local-set-key (kbd "C-c C-c") #'compile)
  (local-set-key (kbd "C-c C-d") #'xref-find-definitions)
  (local-set-key (kbd "C-c C-?") #'xref-find-references))
(add-hook 'c-mode-hook #'c-configs)
(add-hook 'c++-mode-hook #'c-configs)

(use-package web-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(use-package markdown-mode
  :ensure t)

(use-package erlang
  :ensure t)

(use-package elixir-mode
  :ensure t)

(use-package haskell-mode
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(eldoc-box multiple-cursors rainbow-delimiters rainbow-mode color-theme-sanityinc-tomorrow)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
