(use-package tex
  :ensure auctex)

;; Automatically save style information when saving the buffer.
;; AUCTEX will create the auto directory automatically.
(setq TeX-auto-save t)


;; Parse file after loading it if no style hook is found for it.
(setq TeX-parse-self t)


;; If you often use \include or \input, you should make AUCTEX aware of the multifile document structure.
(setq-default TeX-master nil)           ; Query for master file.


;; Automatically insert '$...$' in plain TEX files, and '\(...\)' in LaTEX files by pressing $
(add-hook 'plain-TeX-mode-hook
          (lambda () (set (make-local-variable 'TeX-electric-math)
                          (cons "$" "$"))))
(add-hook 'LaTeX-mode-hook
          (lambda () (set (make-local-variable 'TeX-electric-math)
                          (cons "\\(" "\\)"))))


;; If this option is on, just typing (, { or [ immediately
;; adds the corresponding right brace ')', '}' or ']'.  The
;; point is left after the opening brace. If there is an
;; active region, braces are put around it.
(setq LaTeX-electric-left-right-brace t)


;; Get a full featuered LaTeX-section command.
(setq LaTeX-section-hook
      '(LaTeX-section-heading
        LaTeX-section-title
        ;; LaTeX-section-toc
        LaTeX-section-section
        LaTeX-section-label))


;; Enable LaTeX Math mode by default.
;; Easy insertion of LaTeX math symbols.  If you give a
;; prefix argument, the symbols will be surrounded by dollar signs.
(add-hook 'LaTeX-mode-hook #'LaTeX-math-mode)


;; Define the function used when you type Enter.
(setq TeX-newline-function 'reindent-then-newline-and-indent)


;; When point is on one of the characters, it'll be unprettified automatically,
;; meaning you see the verbatim text again.
(setq prettify-symbols-unprettify-at-point 'right-edge)


;; Enable prettification in AUCTEX.
(add-hook 'LaTeX-mode-hook 'prettify-symbols-mode)


;; Enable flycheck
(add-hook 'LaTeX-mode-hook 'flycheck-mode)

;; Add XeLaTeX program to run on the master or region file.
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list
                '("XeLaTeX" "xelatex  %(output-dir) %s" TeX-run-command t t :help "Run xelatex")
                t))


;; ;; Set the default command to run in LaTeX mode.
 (add-hook 'LaTeX-mode-hook (lambda ()
                              (setq TeX-command-default "LaTeX")))

;; ;; Add user defined viewer Skim.
(setq TeX-view-program-list '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline -g -b %n %o %b")))

;; Activate pdf tools.
(pdf-tools-install)

;; Select the viewer to start view pdf output.
(setq TeX-view-program-selection
      '((output-dvi "open")
        (output-pdf "Skim")
        (output-html "open")))

;; Add TeX-source-correlate-mode to LaTeX mode to support forward 
;; and inverse search.
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)

;; Whether Emacs retains the focus when viewing PDF files with Evince.
;; If this option is set to non-nil, Emacs will retain the focus.
;;(setq TeX-view-evince-keep-focus t)

;; If TeX-source-correlate-mode is active and a viewer is invoked,
;; the default behavior is to ask if a server process should be started.
;; Set this variable to t if the question should be inhibited and the
;; server should always be started.
(setq TeX-source-correlate-start-server t)

;; Make special mouse event do forward search at the clicked position.
(eval-after-load "tex"
  '(define-key TeX-source-correlate-map [C-down-mouse-1]
     #'TeX-view-mouse))

;; A function that will be called after performing an inverse search
;; from pdf in order to raise the current Emacs frame.
(setq TeX-raise-frame-function #'x-focus-frame)

;; When this boolean variable is non-nil, the error overview will be
;; automatically opened after running TEX if there are errors or warnings to show.
(setq TeX-error-overview-open-after-TeX-run t)


;; The output files will be placed in `build` directory.
;; This can improve the readability of the tex files.
(setq-default TeX-output-dir "build")


;; Add flyspell mode to latex mode.
(add-hook 'LaTeX-mode-hook 'flyspell-mode)


;; Add visual-line-mode to latex mode.
(add-hook 'LaTeX-mode-hook 'visual-line-mode)


;; Minor mode with distinct support for \label, \ref and \cite in LaTeX.
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)


;; If non-nil, insert braces after typing '^' and '_' in math mode.
(setq TeX-electric-sub-and-superscript t)


;; Support folding sections in LaTeX.
(add-hook 'LaTeX-mode-hook 'outline-minor-mode)


(put 'TeX-narrow-to-group 'disabled nil)
(put 'LaTeX-narrow-to-environment 'disabled nil)
