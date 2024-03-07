(TeX-add-style-hook
 "external-packages"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("geometry" "a4paper" "inner=1.5cm" "outer=3cm" "top=2cm" "bottom=3cm" "bindingoffset=1cm") ("setspace" "onehalfspacing") ("caption" "font=large" "labelfont=bf" "margin=1cm") ("placeins" "section") ("fontenc" "T1") ("fncychap" "Lenny")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "listings"
    "xspace"
    "url"
    "microtype"
    "inputenc"
    "parskip"
    "geometry"
    "setspace"
    "fancyhdr"
    "paralist"
    "enumitem"
    "array"
    "booktabs"
    "multirow"
    "caption"
    "graphicx"
    "pdfpages"
    "eso-pic"
    "textpos"
    "placeins"
    "float"
    "wrapfig"
    "subfig"
    "varioref"
    "xr"
    "hyperref"
    "tocloft"
    "minitoc"
    "tocbibind"
    "index"
    "fontenc"
    "titlesec"
    "color"
    "xcolor"
    "tikz"
    "amsmath"
    "longtable"
    "xsavebox"
    "fncychap")
   (TeX-add-symbols
    "TUG")
   (LaTeX-add-labels
    "sec:listings"
    "sec:geometry"
    "sec:setspace"
    "sec:fancyhdr"
    "sec:paralist"
    "sec:enumitem"
    "sec:array"
    "sec:booktabs"
    "sec:multirow"
    "sec:caption"
    "sec:graphicx"
    "sec:pdfpages"
    "sec:eso-pic"
    "sec:textpos"
    "sec:placeins"
    "sec:float"
    "sec:wrapfig"
    "sec:subfig"
    "sec:varioref"
    "sec:xr"
    "intro"
    "sec:hyperref"
    "sec:tocloft"
    "sec:minitoc"
    "cha:chapter"
    "sec:tocbibind"
    "sec:index"
    "sec:fontenc"
    "sec:titlesec"
    "sec:color"
    "sec:xcolor"
    "sec:tikz"
    "sec:amsmath"
    "sec:longtable"
    "tab:dired-commands"
    "sec:xsavebox"
    "sec:tablefootnote"
    "sec:fncychap"
    "sec:fontawesome")
   (LaTeX-add-bibliographies
    "name")
   (LaTeX-add-index-entries
    "package"
    "package!listings"
    "package!xspace"
    "package!url"
    "package!microtype"
    "package!inputenc"
    "package!parskip"
    "package!geometry"
    "package!setspace"
    "package!fancyhdr"
    "package!paralist"
    "package!enumitem"
    "package!array"
    "package!bookabs"
    "package!multirow"
    "package!caption"
    "package!graphicx"
    "package!pdfpages"
    "package!eso-pic"
    "package!textpos"
    "package!placeins"
    "package!float"
    "package!wrapfig"
    "package!subfig"
    "package!varioref"
    "package!xr"
    "package!hyperref"
    "package!tocloft"
    "package!minitoc"
    "package!tocbibind"
    "package!index"
    "network"
    "package!fontenc"
    "package!titlesec"
    "package!color"
    "package!xcolor"
    "package!tikz"
    "package!amsmath")
   (LaTeX-add-saveboxes
    "lstbox")
   (LaTeX-add-xcolor-definecolors
    "name"))
 :latex)

