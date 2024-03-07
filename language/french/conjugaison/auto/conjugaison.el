(TeX-add-style-hook
 "conjugaison"
 (lambda ()
   (TeX-run-style-hooks
    "latex2e"
    "~/latex/article-preamble"
    "article"
    "art10"))
 :latex)

