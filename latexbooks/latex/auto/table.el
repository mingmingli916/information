(TeX-add-style-hook
 "table"
 (lambda ()
   (TeX-add-symbols
    '("head" 1))
   (LaTeX-add-labels
    "sec:tabular"
    "sec:spann-entr-over"
    "sec:adding-capt-tabl"
    "tab:caption"))
 :latex)

