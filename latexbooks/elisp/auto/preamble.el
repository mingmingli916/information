(TeX-add-style-hook
 "preamble"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("geometry" "a4paper" "inner=1.5cm" "outer=3cm" "top=2cm" "bottom=3cm" "bindingoffset=1cm") ("setspace" "onehalfspacing") ("caption" "font=large" "labelfont=bf" "margin=1cm") ("placeins" "section") ("inputenc" "utf8") ("fontenc" "T1") ("fncychap" "Lenny") ("parskip" "indent" "skip=10ptplus1pt")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (TeX-run-style-hooks
    "xspace"
    "url"
    "booktabs"
    "tcolorbox"
    "geometry"
    "setspace"
    "fancyhdr"
    "paralist"
    "enumitem"
    "array"
    "multirow"
    "caption"
    "placeins"
    "microtype"
    "inputenc"
    "fontenc"
    "graphicx"
    "pdfpages"
    "varioref"
    "xr"
    "hyperref"
    "float"
    "index"
    "lmodern"
    "tocbibind"
    "titlesec"
    "color"
    "xcolor"
    "textcomp"
    "listings"
    "amsfonts"
    "bbm"
    "dsfont"
    "eufrak"
    "amsmath"
    "fncychap"
    "longtable"
    "parskip"
    "indentfirst"
    "xsavebox"
    "tablefootnote"
    "txfonts"
    "pmboxdraw")
   (TeX-add-symbols
    '("myfigure" ["argument"] 1)
    '("normal" 1)
    '("head" 1)
    '("funcword" 1)
    '("warningword" 1)
    '("argument" 1)
    '("keyword" 1)
    "auctex")
   (LaTeX-add-saveboxes
    "lstbox"))
 :latex)

