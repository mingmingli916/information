(TeX-add-style-hook
 "algorithm"
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
   (LaTeX-add-labels
    "sec:what-algorithm"
    "sec:instance-problem"
    "sec:correct-algorithms"
    "sec:two-char-many"
    "sec:data-structure"
    "sec:core-technique"
    "sec:hard-problems"
    "sec:algorithm-efficiency"
    "sec:algor-as-techn"
    "sec:loop-invariant"
    "sec:analyzing-algorithms"
    "sec:core-idea-modeling"
    "sec:analysis-algorithm"
    "sec:worst-case-analysis"
    "sec:abstraction"
    "sec:growth-functions"))
 :latex)

