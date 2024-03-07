(TeX-add-style-hook
 "figure"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("graphicx" "demo")))
   (TeX-run-style-hooks
    "graphicx"))
 :latex)

