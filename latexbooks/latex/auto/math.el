(TeX-add-style-hook
 "math"
 (lambda ()
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (LaTeX-add-labels
    "cha:math-formulas"
    "sec:math-mode"
    "sec:embedd-math-expr"
    "sec:displaying-formulas"
    "sec:numbering-equations"
    "key"
    "sec:common"
    "tab:common"
    "sec:dots"
    "tab:dots"
    "sec:greek-letters"
    "tab:greek-letters"
    "sec:fonts"
    "tab:fonts"
    "sec:multi-line-formulas"
    "sec:operators"
    "tab:standard-latex-symbols"
    "sec:math-structures"
    "tab:matrix"
    "sec:stakcing-expressions"
    "sec:underl-overl"
    "sec:setting-accents"
    "tab:accents"
    "sec:puting-symbol-above"))
 :latex)

