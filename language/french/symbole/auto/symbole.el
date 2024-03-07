(TeX-add-style-hook
 "symbole"
 (lambda ()
   (TeX-run-style-hooks
    "latex2e"
    "~/latex/article-preamble"
    "article"
    "art10"))
 :latex)

