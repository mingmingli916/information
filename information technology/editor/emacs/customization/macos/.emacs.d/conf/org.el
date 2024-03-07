;; For a better experience, this three Org commands ought to be accessible anywhere in Emacs, not just in Org buffers.
;; It stores a link to the current location for later insertion into an Org buffer.
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)


;; Number of empty lines needed to keep an empty line between collapsed trees.
(setq-default org-cycle-separator-lines 8)


;; Entering Org mode will switch to OVERVIEW.
(setq org-startup-folded 'content)


;; Check if in invisible region before inserting or deleting a character.
;; Make point visible, and do the requested edit.
(setq org-catch-invisible-edits 'show)


;; M-RET will go the end of the lien before making a new line.
(setq org-M-RET-may-split-line '((default)))


;; To easily insert matching delimiters.
(add-hook 'org-mode-hook 'electric-pair-mode)


;; Add flyspell mode as minor mode.
(add-hook 'org-mode-hook 'flyspell-mode)


;; The original binding is C-c C-x C-n and C-c C-x C-p.
;; This is to long.
;; In org mode, M-n and M-p are not used so rebind them.
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "M-n") #'org-next-link)
  (define-key org-mode-map (kbd "M-p") #'org-previous-link))


;; This is the TODO entry keyword sequences.
;; t,d are fast access keys used to fast changed to this state
;; when you type C-c C-t.
;; ! for timestamp, @ for note with timestamp.
;; /! for also record leaving timestamp.
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d@)")))


;; Org blocks entries from changing state to DONE while they
;; have TODO children that are not DONE. Furthermore, if an
;; entry has a property ‘ORDERED’, each of its TODO children
;; is blocked until all earlier siblings are marked as done. 
(setq org-enforce-todo-dependencies t)


;; Record the time and node when you change an item into DONE state.
(setq org-log-done 'note)


;; Insert state change notes and time stamps into a drawer.
(setq org-log-into-drawer t)


;; Number of days before expiration during which a deadline becomes active.
(setq org-deadline-warning-days 14)


;; Number of days to include in overview display.
(setq org-agenda-span 'month)


;; Include in the agenda entries from the Emacs Calendar’s diary.
(setq org-agenda-include-diary t)


;; Preserve all line breaks when exporting.
(setq org-export-preserve-breaks t)


;; Non-nil means interpret "_" and "^" for export.
;; Use {} to enclose the sub/superscript.
(setq org-export-with-sub-superscripts '{})


;; org-roam
(use-package org-roam
  :ensure t
  :config
  ;; set org-roam-directory.
  ;; The file-truename function is only necessary when you use symbolic links inside org-roam-directory: Org-roam does not resolve symbolic links.
  ;; One can however instruct Emacs to always resolve symlinks, at a performance cost:
  (setq org-roam-directory (file-truename "~/note"))
  ;; setup Org-roam to run functions on file changes to maintain cache consistency.   
  (org-roam-db-autosync-mode)
  :bind (("\C-ci" . org-roam-node-insert)
         ("\C-cf" . org-roam-node-find)))

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



;; Because Org-roam files are plain org files,
;; they can be exported easily using org-export
;; to a variety of formats, including html and
;; pdf. However, Org-roam relies heavily on
;; ID links, which Org’s html export has poor
;; support of. To fix this, Org-roam provides
;; a bunch of overrides to better support export.
(use-package org-roam-export)



;; Use bullets instead of * for headlines.
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))


;; Hide font marks
(setq-default org-hide-emphasis-markers t)


;; Set the image width
(setq org-image-actual-width 300)


;; Turn on pretty entities.
(setq org-pretty-entities t)


;; All the org files in the info will be collected into agenda view.
(setq org-agenda-files (directory-files-recursively "~/note/" "\\.org$"))
