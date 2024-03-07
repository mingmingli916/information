(TeX-add-style-hook
 "mytikz"
 (lambda ()
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "tikz")
   (TeX-add-symbols
    "costhirty")
   (LaTeX-add-labels
    "cha:tikz"
    "sec:basics"
    "sec:sett-up-endir"
    "sec:straight-path"
    "sec:curved-path"
    "sec:circle-path"
    "sec:rectangle-path"
    "sec:grid-path"
    "sec:arc-path"
    "sec:clipping-path"
    "sec:filling"
    "sec:shading"
    "sec:spec-coord"
    "sec:adding-arrow"
    "sec:scoping"
    "sec:transformations"
    "sec:loops"
    "sec:adding-text"
    "sec:load-libr-pack"
    "sec:set-style"
    "sec:set-color"
    "sec:local-definition"
    "sec:node"
    "sec:snake-line"
    "sec:examples"
    "sec:pict-karls-stud"
    "sec:petri-net-hagen")
   (LaTeX-add-xcolor-definecolors
    "anglecolor"
    "sincolor"
    "tancolor"
    "coscolor"))
 :latex)

