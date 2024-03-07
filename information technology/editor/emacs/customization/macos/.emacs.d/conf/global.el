;; Alter modifiers to suit into MacOS keyboard.
(setq ns-alternate-modifier 'super)
(setq ns-command-modifier 'meta)



;; Show date and 24 format time on mode line
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-format "[%Y-%m-%d %a %H:%M %Z]")
(display-time-mode 1)



;; Sort each day’s diary entries by their time of day.
(add-hook 'diary-list-entries-hook 'diary-sort-entries t)


;; Enable Electric-Pair-Mode globally.
(electric-pair-mode)


;; Show column number in mode line.
(setq column-number-mode t)



;; Defualt directory when you open emacs.
(setq default-directory "~/note/")



;; Hide toolbar.
(tool-bar-mode 0)


;; Turn on line number.
(global-display-line-numbers-mode t)


;; Add buffer size display in the mode line.
(size-indication-mode)


;; Add battery status display in mode line.
(display-battery-mode)


;; Inhibit startup scrren.
(setq inhibit-startup-screen t)


;; maximize emacs
(add-hook 'window-setup-hook #'toggle-frame-fullscreen)


;; Make sure spaces are used when indenting code
(setq-default indent-tabs-mode nil)



;; turn on flyspell mode by default
(setq-default flyspell-mode t)



;; set the first day of a week to monday
(setq calendar-week-start-day 1)


;; start calendar at start emacs
(calendar)
;; After opening calendar, return the cursor to the original buffer.
(other-window 1)


;; show dairy
(diary)


;; When this mode is on, typing in the minibuffer continuously
;; displays a list of possible completions that match the string
;; you have typed.
(icomplete-mode)


;; Non-nil means a single space does not end a sentence.
;; Here a single space can end a sentence.
(setq-default sentence-end-double-space nil)






;; ------------------------------------------------------------





;; Use package manager interface.
(require 'package)


;; Add melpa site to package archives.
;; This is used define where to fetch package.
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)


;; Add Org's package repository.
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)


;; Load Emacs Lisp packages, and activate them.
(package-initialize)


;; The use-package macro allows you to isolate package configuration in your .emacs file
;; in a way that is both performance-oriented and, well, tidy.
(require 'use-package)



;; This package provides three modes that display the current command
;; and its key or mouse binding. `keycast-mode' shows the current binding
;; in the mode-line while `keycast-tab-bar-mode' displays it in the
;; tab-bar. `keycast-log-mode' displays a list of recent bindings in a
;; dedicated frame.
(use-package keycast
  :ensure t
  :config
  (keycast-tab-bar-mode))





;; ;; Install flycheck once.
;; (use-package flycheck
;;   :ensure t
;;   :config
;;   ;; Enable flycheck-mode as minor mode globaly.
;;   (global-flycheck-mode))




(use-package ace-window
  :ensure t
  :config
  ;; This is the list of initial characters used in window labels.
  ;; The characters are used after ace-window command to select the window.
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  :bind
  ;; Rebind M-o to invoke ace-window command.
  ("M-o" . ace-window))




;; This package show the numer of found string when you search.
(use-package anzu
  :ensure t
  :config
  ;; Enable anzu global mode.
  (global-anzu-mode +1)
  ;; Set face attribute in mode line.
  (set-face-attribute 'anzu-mode-line nil
                      :foreground "yellow" :weight 'bold)
  (setq anzu-mode-lighter "")
  (setq anzu-deactivate-region t)
  (setq anzu-search-threshold 1000)
  (setq anzu-replace-threshold 50)
  (setq anzu-replace-to-string-separator " => ")
  (define-key isearch-mode-map [remap isearch-query-replace]  #'anzu-isearch-query-replace)
  (define-key isearch-mode-map [remap isearch-query-replace-regexp] #'anzu-isearch-query-replace-regexp))




;; which-key is a minor mode for Emacs that displays the key bindings
;; following your currently entered incomplete command (a prefix) in a popup.
(use-package which-key
  :config
  (which-key-mode))
