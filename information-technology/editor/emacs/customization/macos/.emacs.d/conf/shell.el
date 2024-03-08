;; This package is used to fix your $PATH environment variable.
(use-package exec-path-from-shell)


;; Initialize environment from the user’s shell.
(exec-path-from-shell-initialize)


;; Make URLs clickable.
(add-hook 'shell-mode-hook (lambda () (goto-address-mode )))


;; Make file paths clickable.
(add-hook 'shell-mode-hook 'compilation-shell-minor-mode)


;; To support --dired option.
;(setq ls-lisp-use-insert-directory-program nil)
;(require 'ls-lisp)
