(TeX-add-style-hook
 "règles_de_prononciation"
 (lambda ()
   (TeX-run-style-hooks
    "latex2e"
    "~/latex/article-preamble"
    "article"
    "art10"))
 :latex)

