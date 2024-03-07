(TeX-add-style-hook
 "numbers"
 (lambda ()
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (LaTeX-add-labels
    "cha:numbers"
    "sec:iteger-basics"
    "sec:float-point-basics"
    "sec:type-pred-numb"
    "sec:comparison-numbers"
    "sec:numeric-conversions"
    "sec:arithm-opera"
    "sec:rounding-operations"
    "sec:bitw-opeart-iteg"
    "sec:stand-math-funct"
    "sec:random-numbers"
    "sec:summary-1"))
 :latex)

