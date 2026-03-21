(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;
;; Appearance.
;;

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 1)
(blink-cursor-mode 0)
(setq-default display-line-numbers-width 3)
(setq-default show-trailing-whitespace t)
(add-hook 'minibuffer-mode-hook (lambda () (setq show-trailing-whitespace nil)))
(add-hook 'prog-mode-hook
	  (lambda ()
	    (display-line-numbers-mode t)
	    (display-fill-column-indicator-mode t)))
(add-hook 'text-mode-hook
	  (lambda ()
	    (display-line-numbers-mode t)
	    (display-fill-column-indicator-mode t)))

(set-face-attribute 'default nil :font "Hack-11")
(set-frame-font "Hack-11" nil t)

(setq scroll-step 1)
(setq scroll-conservatively 100000)

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :init
  (load-theme 'sanityinc-tomorrow-night t)
  (set-face-attribute 'trailing-whitespace nil
                      :inherit nil
                      :background "#cc6666"))

(use-package ido-vertical-mode
  :ensure t
  :init
  (setq ido-vertical-show-count t)
  (ido-vertical-mode t))

;;
;; Interface.
;;

(defalias 'yes-or-no-p 'y-or-n-p)
(setopt use-short-anwsers t)
(windmove-default-keybindings 'meta)
(setq-default fill-column 80)

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

(setq make-backup-files nil)

(setq-default compile-command "")

(defun window-half-height ()
  (max 1 (/ (1- (window-height (selected-window))) 2)))

(defun scroll-up-half ()
  (interactive)
  (scroll-up (window-half-height)))

(defun scroll-down-half ()
  (interactive)
  (scroll-down (window-half-height)))

(global-set-key (kbd "C-v") #'scroll-up-half)
(global-set-key (kbd "M-v") #'scroll-down-half)

(global-set-key (kbd "C-c c") #'compile)

(add-hook 'find-file-hook
	  (lambda () (setq default-directory command-line-default-directory)))

;; Stolen from (http://endlessparentheses.com/ansi-colors-in-the-compilation-buffer-output.html)
(require 'ansi-color)
(defun colorize-compilation ()
  "Colorize from `compilation-filter-start' to `point'."
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point))))

(add-hook 'compilation-filter-hook
          #'colorize-compilation)

(use-package lice
  :ensure t)

(use-package magit
  :ensure t)

(use-package magit-gh
  :ensure t
  :after magit)

(use-package pdf-tools
  :ensure t)

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

(add-hook 'prog-mode-hook
	  (lambda ()
	    (etags-regen-mode t)
	    (xref-etags-mode t)))

;;
;; Langs.
;;

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (prettify-symbols-mode t)))

(use-package go-mode
  :ensure t
  :init
  (add-hook 'go-mode-hook
	    (lambda ()
	      (setq tab-width 4)
	      (setq indent-tabs-mode t)
	      (add-hook 'before-save-hook #'gofmt-before-save nil t))))

(use-package clang-format
  :ensure t)
(setq-default c-basic-offset 4)
(setq-default c-default-style "linux")
(defun c-configs ()
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  (add-hook 'before-save-hook 'clang-format nil t)
  ;; I hate c-mode for using C-c.
  (local-set-key (kbd "C-c C-c") #'compile))
(add-hook 'c-mode-hook #'c-configs)
(add-hook 'c++-mode-hook #'c-configs)

(setq-default pascal-indent-level 4)
(add-hook 'pascal-mode-hook
	  (lambda ()
	    (setq tab-width 4)
	    (setq pascal-indent-level 4)
	    (setq pascal-auto-lineup '())
	    (setq indent-tabs-mode nil)
	    (local-set-key (kbd "C-c C-c") #'compile)))

(use-package web-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(use-package markdown-mode
  :ensure t)

(use-package nasm-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.asm\\'" . nasm-mode))
  (add-to-list 'auto-mode-alist '("\\.s\\'" . nasm-mode)))

(use-package zig-mode
  :ensure t)

(use-package odin-mode
  :commands odin-mode
  :vc (:url "https://github.com/mattt-b/odin-mode.git"
	    :rev :last-release))

(use-package elixir-mode
  :ensure t
  :init
  (add-hook 'elixir-mode-hook
	    (lambda () (add-hook 'before-save-hook 'elixir-format nil t))))

(use-package haskell-mode
  :ensure t
  :init
  (setq haskell-stylish-on-save t))

(use-package rust-mode
  :ensure t
  :init
  (setq rust-format-on-save t))

;;(add-hook 'LaTeX-mode-hook
;;	  (lambda ()
;;	    (setq show-trailing-whitespace t)))

;;
;; Tasks system.
;;
(setq-default tasks '())
(defvar tasks/history nil)
(defun run-task ()
  (interactive)
  (let* ((choices (mapcar #'car tasks))
         (last (car tasks/history))
         (choice (completing-read
                  "Task: "
                  choices
                  nil t
                  nil 'tasks/history
                  last)))
    (compile
     (cadr (assoc choice tasks)))))
(global-set-key (kbd "C-c C-t") #'run-task)
(global-set-key (kbd "C-c t") #'run-task)

;; Finally read project specific configuration.
(let ((file-name (concat default-directory ".emacs.el")))
  (if (file-exists-p file-name)
      (load-file file-name)
    nil))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(amx clang-format color-theme-sanityinc-tomorrow copilot counsel elixir-mode
	 go-mode haskell-mode ido-completing-read+ ido-vertical-mode lice
	 magit-gh markdown-mode multiple-cursors nasm-mode odin-mode pdf-tools
	 rainbow-delimiters rainbow-mode rust-mode web-mode zig-mode))
 '(package-vc-selected-packages
   '((lean4-mode :url "https://github.com/leanprover-community/lean4-mode.git")))
 '(safe-local-variable-values '((elixir-basic-offset . 2))))
(put 'upcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
