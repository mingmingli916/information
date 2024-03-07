(TeX-add-style-hook
 "latex-base"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "12pt")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (TeX-run-style-hooks
    "latex2e"
    "preamble"
    "article"
    "art10"
    "art12")
   (TeX-add-symbols
    '("keyword" 1)
    "TUG"
    "keyword")
   (LaTeX-add-labels
    "sec:what-latex"
    "sec:environment"
    "sec:breaks-empty-lines"
    "sec:special-symbols"
    "sec:inst-extra-pack"
    "sec:modes")
   (LaTeX-add-index-entries
    "latex"
    "latex!{logical formatting}"
    "latex!command"
    "latex!comment"
    "latex!environment"
    "latex!symbols"
    "latex!float"))
 :latex)

