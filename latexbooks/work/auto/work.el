(TeX-add-style-hook
 "work"
 (lambda ()
   (TeX-run-style-hooks
    "latex2e"
    "preamble"
    "title"
    "dedication"
    "日志"
    "态度"
    "求职"
    "ctexbook"
    "ctexbook10")
   (LaTeX-add-bibliographies
    "tex"))
 :latex)

