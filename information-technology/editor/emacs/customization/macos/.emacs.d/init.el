(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("/Users/li/info/ai/ai.org" "/Users/li/info/ai/azure.org" "/Users/li/info/ai/pytorch.org" "/Users/li/info/ai/tensorflow.org" "/Users/li/info/algorithms/algorithms.org" "/Users/li/info/bigdata/ambari/ambari.org" "/Users/li/info/bigdata/codis/codis.org" "/Users/li/info/bigdata/hadoop/hadoop.org" "/Users/li/info/bigdata/hive/hive.org" "/Users/li/info/bigdata/kafka/kafka.org" "/Users/li/info/canada/pr/pr.org" "/Users/li/info/deprecated/ai/vision/algorithms.org" "/Users/li/info/deprecated/ai/vision/opencv.org" "/Users/li/info/deprecated/ai/vision/texture.org" "/Users/li/info/deprecated/ai/ai-introduction.org" "/Users/li/info/deprecated/ai/deep-learning-for-computer-vision-with-python-imagenet.org" "/Users/li/info/deprecated/ai/deep-learning-for-computer-vision-with-python-practitioner.org" "/Users/li/info/deprecated/ai/deep-learning-for-computer-vision-with-python-starter.org" "/Users/li/info/deprecated/ai/deep-learning.org" "/Users/li/info/deprecated/ai/lib.org" "/Users/li/info/deprecated/ai/math.org" "/Users/li/info/deprecated/ai/metric.org" "/Users/li/info/deprecated/ai/my-understanding.org" "/Users/li/info/deprecated/ai/ocr.org" "/Users/li/info/deprecated/ai/resources.org" "/Users/li/info/deprecated/article/ai/pca.org" "/Users/li/info/deprecated/article/algorithm/binary-adding.org" "/Users/li/info/deprecated/article/algorithm/binary-search.org" "/Users/li/info/deprecated/article/algorithm/bit-operation.org" "/Users/li/info/deprecated/article/algorithm/hashmap.org" "/Users/li/info/deprecated/article/algorithm/linear-search.org" "/Users/li/info/deprecated/article/algorithm/list-tree-graph-hypergraph.org" "/Users/li/info/deprecated/article/algorithm/merge-sort.org" "/Users/li/info/deprecated/article/algorithm/selection-sort.org" "/Users/li/info/deprecated/article/django+nginx.org" "/Users/li/info/deprecated/article/future-efficiency.org" "/Users/li/info/deprecated/article/list-append-and-plus.org" "/Users/li/info/deprecated/article/study.org" "/Users/li/info/deprecated/papers/references.org" "/Users/li/info/deprecated/programming/elisp/elisp.org" "/Users/li/info/deprecated/programming/elisp/functions.org" "/Users/li/info/deprecated/programming/elisp/variable.org" "/Users/li/info/deprecated/programming/latex/latex-beginner-guide/latex.org" "/Users/li/info/deprecated/programming/latex/latex-reference.org" "/Users/li/info/deprecated/programming/latex/latex.org" "/Users/li/info/deprecated/programming/latex/packages.org" "/Users/li/info/deprecated/programming/scheme/book-little-schemer/core.org" "/Users/li/info/deprecated/逆商-记忆.org" "/Users/li/info/education/master in laval/preparation.org" "/Users/li/info/emacs/emacs.org" "/Users/li/info/family/junjun/vocabulary.org" "/Users/li/info/family/junjun/句型.org" "/Users/li/info/family/junjun/句式.org" "/Users/li/info/french/FIA-2-Michèle Tremblay/po.org" "/Users/li/info/french/vocab.org" "/Users/li/info/jobs/job.org" "/Users/li/info/knowledge/knowledge.org" "/Users/li/info/memory/memory.org" "/Users/li/info/notebook/c/c.org" "/Users/li/info/notebook/csapp/c/new2c.org" "/Users/li/info/notebook/csapp/computer-systems-a-programmers-perspective.org" "/Users/li/info/notebook/deep-learning/deep-learning.org" "/Users/li/info/notebook/elisp/elisp.org" "/Users/li/info/notebook/mariadb/mariadb.org" "/Users/li/info/old/git/git-practice.org" "/Users/li/info/old/git/git-server.org" "/Users/li/info/old/git/pro-git.org" "/Users/li/info/philosophy/philosophy.org" "/Users/li/info/pmp/me.org" "/Users/li/info/private/info.org" "/Users/li/info/programming/elisp/elisp.org" "/Users/li/info/programming/python/python.org" "/Users/li/info/programming/programming.org" "/Users/li/info/sport/sport.org" "/Users/li/info/typing/typing.org" "/Users/li/info/unix-like/scripts/scripts.org" "/Users/li/info/unix-like/commands.org" "/Users/li/info/unix-like/env.org" "/Users/li/info/unix-like/linux.org"))
 '(org-babel-load-languages '((emacs-lisp . t) (python . t) (shell . t)))
 '(org-modules
   '(ol-bbdb ol-bibtex ol-docview ol-doi ol-eww ol-gnus org-habit ol-info ol-irc ol-mhe ol-rmail ol-w3m))
 '(org-priority-default 67)
 '(org-priority-lowest 69)
 '(package-selected-packages
   '(org-roam-ui org-roam eshell-syntax-highlighting esh-help pcomplete-extension esh-autosuggest keycast keycase lsp-ui which-key dap-mode magit lsp-mode use-package treemacs-tab-bar treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil shrink-path pyvenv pdf-tools org-bullets jedi-core highlight-indentation flycheck exec-path-from-shell compat auto-complete-auctex auctex anzu))
 '(warning-suppress-types '((websocket) (websocket))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Global configuration.
(load-file "~/.emacs.d/conf/global.el")

;; Abbrivation configuration.
(load-file "~/.emacs.d/conf/abbr.el")

;; Macro configuration.
(load-file "~/.emacs.d/conf/macro.el")

;; Tex configuration.
(load-file "~/.emacs.d/conf/tex.el")

;; Version control configuration.
(load-file "~/.emacs.d/conf/vs.el")

;; Org mode configuration.
(load-file "~/.emacs.d/conf/org.el")

;; Python configuration.
(load-file "~/.emacs.d/conf/python.el")

;; User defined functions.
(load-file "~/.emacs.d/conf/self.el")

;; Shell configuration.
(load-file "~/.emacs.d/conf/shell.el")









;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; eshell
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package esh-autosuggest
;;   :hook (eshell-mode . esh-autosuggest-mode)
;;   ;; If you have use-package-hook-name-suffix set to nil, uncomment and use the
;;   ;; line below instead:
;;   ;; :hook (eshell-mode-hook . esh-autosuggest-mode)
;;   :ensure t)


;; (use-package eshell-syntax-highlighting
;;   :after eshell-mode
;;   :ensure t ;; Install if not already installed.
;;   :config
;;   ;; Enable in all Eshell buffers.
;;   (eshell-syntax-highlighting-global-mode))
;; (eshell-syntax-highlighting-global-mode)







