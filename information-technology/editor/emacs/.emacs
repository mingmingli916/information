

;; >>>>>>>>>>>>>>>>>>>> Package Manager >>>>>>>>>>>>>>>>>>>> 
;; Use package manager interface.
(require 'package)


;; Add melpa site to package archives.
;; This is used define where to fetch package.
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Add Org's package repository.
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;; Load Emacs Lisp packages, and activate them.
(package-initialize)

;; The use-package macro allows you to isolate package configuration in your .emacs file
;; in a way that is both performance-oriented and, well, tidy.
(require 'use-package)
;; <<<<<<<<<<<<<<<<<<<< Package Manager <<<<<<<<<<<<<<<<<<<<



;; >>>>>>>>>>>>>>>>>>>> Installed Packages >>>>>>>>>>>>>>>>>>>>
;; This package provides four modes that display
;; the current command and its key or mouse binding.
(use-package keycast
  :ensure t
  :config
  (keycast-mode-line-mode))


;; This packge make changing the windows easier.
(use-package ace-window
  :ensure t
  :config
  ;; This is the list of initial characters used in window labels.
  ;; The characters are used after ace-window command to select the window.
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  :bind
  ;; Rebind M-o to invoke ace-window command.
  ("M-o" . ace-window))


;; which-key is a minor mode for Emacs that displays the key bindings
;; following your currently entered incomplete command (a prefix) in a popup.
(use-package which-key
  :ensure t
  :config
  (which-key-mode))


;; Magit is a complete text-based user interface to Git.
(use-package magit
  :ensure t)


;; org-roam
(use-package org-roam
  :ensure t
  :config
  ;; set org-roam-directory.
  ;; The file-truename function is only necessary when you use symbolic links inside org-roam-directory: Org-roam does not resolve symbolic links.
  ;; One can however instruct Emacs to always resolve symlinks, at a performance cost:
  (setq org-roam-directory (file-truename "~/info")
        org-roam-capture-templates
        '(("d" "default" plain "%?"
           ;; This is not the perfect solution.
           ;; Each time I create a node, I need to change buffer a the directory I want my node place in.
           ;; If the current buffer links to a file, there will be a error.
           :target (file+head "roam/${slug}.org" "#+title: ${title}\n")
           :unnarrowed t)))
  ;; setup Org-roam to run functions on file changes to maintain cache consistency.   
  (org-roam-db-autosync-mode)
  (require 'org-roam-export)
  :bind (("\C-ci" . org-roam-node-insert)
         ("\C-cf" . org-roam-node-find)
         ("\C-cg" . org-id-get-create)))

;; This package can show org-roam graph in web browser.
(use-package org-roam-ui
  :ensure t
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t)
  ;; Use M-x org-roam-ui-mode RET to enable the global mode.
  ;; It will start a web server on http://127.0.0.1:35901/ and connect to it via a WebSocket for real-time updates.
  (org-roam-ui-mode))


;; This package is used to fix your $PATH environment variable.
(use-package exec-path-from-shell
  :ensure t
  :config
  ;; Initialize environment from the user’s shell.
  (exec-path-from-shell-initialize))

;; <<<<<<<<<<<<<<<<<<<< Installed Packages <<<<<<<<<<<<<<<<<<<<






;; >>>>>>>>>>>>>>>>>>>> Global configuration >>>>>>>>>>>>>>>>>>>>

;; Alter modifiers to suit into MacOS keyboard.
(setq ns-alternate-modifier 'super)
(setq ns-command-modifier 'meta)

;; Disable tool bar.
(tool-bar-mode -1)

;; Show line number at the left side.
(global-display-line-numbers-mode)

;; Enable Electric-Pair-Mode globally.
(electric-pair-mode)

;; Defualt directory when you open emacs.
;; To make this work, start up screen shoud be inhibited.
(setq default-directory "~/info/")

;; Inhibit startup scrren.
(setq inhibit-startup-screen t)

;; When this mode is on, typing in the minibuffer continuously
;; displays a list of possible completions that match the string
;; you have typed.
(icomplete-mode)

;; Non-nil means a single space does not end a sentence.
;; Here a single space can end a sentence.
(setq-default sentence-end-double-space nil)


(when (string= system-type "darwin")       
  (setq dired-use-ls-dired nil))

;; <<<<<<<<<<<<<<<<<<<< configuration <<<<<<<<<<<<<<<<<<<<




;; >>>>>>>>>>>>>>>>>>>> Org Configuration >>>>>>>>>>>>>>>>>>>>

;; Those bindings save your typing.
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; Number of empty lines needed to keep an empty line between collapsed trees.
(setq-default org-cycle-separator-lines 8)

;; Entering Org mode will switch to OVERVIEW.
(setq org-startup-folded t)

;; Org blocks entries from changing state to DONE while they
;; have TODO children that are not DONE. Furthermore, if an
;; entry has a property ‘ORDERED’, each of its TODO children
;; is blocked until all earlier siblings are marked as done. 
(setq org-enforce-todo-dependencies t)

;; Preserve all line breaks when exporting.
(setq org-export-preserve-breaks t)

;; Turn on pretty entities.
(setq org-pretty-entities t)

;; All the org files in the info will be collected into agenda view.
(setq org-agenda-files (directory-files-recursively "~/info/" "\\.org$"))

;; This enable you excute shell in org mode.
(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)))
(setq org-confirm-babel-evaluate nil)

;; This is the TODO entry keyword sequences.
;; t,d are fast access keys used to fast changed to this state
;; when you type C-c C-t.
;; ! for timestamp, @ for note with timestamp.
;; /! for also record leaving timestamp.
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d@)")
	))

;; Insert state change notes and time stamps into a drawer.
(setq org-log-into-drawer t)

;; Align all tables when visiting a file.
(setq org-startup-align-all-tables t)

;; <<<<<<<<<<<<<<<<<<<< Org Configuration <<<<<<<<<<<<<<<<<<<<



;; <<<<<<<<<<<<<<<<<<<< User Defined Functions <<<<<<<<<<<<<<<<<<<<
(defun my-search-picture ()
  "Search a picture."
  (interactive)
  (save-excursion
    (mark-word)
    (kill-ring-save (mark) (point) t)
    (org-open-link-from-string
     (concat "https://www.google.com/search?q="
	     (substring-no-properties (car kill-ring))
	     "&tbm=isch"
	     )
     )
    (setq kill-ring (cdr kill-ring))
    )
  )
()
;; >>>>>>>>>>>>>>>>>>>> User Defined Functions <<<<<<<<<<<<<<<<<<<<






;; >>>>>>>>>>>>>>>>>>>> Emacs Generated Configuration >>>>>>>>>>>>>>>>>>>>

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(exec-path-from-shell org-roam-export org-roam-ui org-roam magit which-key ace-window keycast)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; <<<<<<<<<<<<<<<<<<<< Emacs Generated Configuration <<<<<<<<<<<<<<<<<<<<
