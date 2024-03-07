(TeX-add-style-hook
 "table"
 (lambda ()
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10")
   (TeX-add-symbols
    '("head" 1)))
 :latex)

