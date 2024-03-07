(TeX-add-style-hook
 "linked-list"
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
    "cha:linked-list"
    "fig:singly-linked-list"
    "fig:doubly-linked-list"
    "sec:singly-linked-list"
    "fig:insert-into-linked-list"
    "fig:delete-from-singled-linked-list"
    "sec:doubly-linked-list"
    "sec:add-operation"
    "fig:add-to-doubly-linked-list"
    "sec:delete-operation"
    "sec:comparison"
    "fig:array-and-linked-list"
    "sec:examples"))
 :latex)

