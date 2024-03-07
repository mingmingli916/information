(TeX-add-style-hook
 "pro-git"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "inputenc"
    "fontenc"
    "graphicx"
    "grffile"
    "longtable"
    "wrapfig"
    "rotating"
    "ulem"
    "amsmath"
    "textcomp"
    "amssymb"
    "capt-of"
    "hyperref")
   (LaTeX-add-labels
    "sec:org6dbc28c"
    "sec:org907cdb0"
    "sec:org3e83215"
    "sec:org369b067"
    "sec:org75b66ea"
    "sec:orgac383b4"
    "sec:orgdb40209"
    "sec:org3cf22ec"
    "sec:org7e4403b"
    "sec:org94c77e6"
    "sec:org2e85862"
    "sec:orgf15ba56"
    "sec:org2a169d4"
    "sec:orgd6fa561"
    "sec:org53bc411"
    "sec:orge38dcba"
    "sec:orga3ef533"
    "sec:org407443e"
    "sec:orgae728fd"
    "sec:org5a0a6bd"
    "sec:orgdf4a0ba"
    "sec:org7084704"
    "sec:org201d1c0"
    "sec:org6096ad6"
    "sec:org8badc20"
    "sec:org561d2f8"
    "sec:orgdda6f58"
    "sec:org45f1de3"
    "sec:org52c3fe1"
    "sec:orgd647cac"
    "sec:org9db2588"
    "sec:orgaacbc63"
    "sec:org1f7b88b"
    "sec:org439448e"
    "sec:org649e381"
    "sec:org5b5711d"
    "sec:orgc76c204"
    "sec:orga2b2134"
    "sec:org99f9a9e"
    "sec:orgc917af4"
    "sec:org7e8ee5a"
    "sec:org645007e"
    "sec:org4d03e6e"
    "sec:org34aaa02"
    "sec:org3ebba5c"
    "sec:orgd0a14f9"
    "sec:orge25a775"
    "sec:orgdba76ad"
    "sec:org45d9313"
    "sec:orgd6df188"
    "sec:org4475f22"
    "sec:orgcfb6bea"
    "sec:org1ef233d"
    "sec:org3c4cc21"
    "sec:org5a470e6"
    "sec:org24db867"
    "sec:orgb330fea"
    "sec:org479ef4b"
    "sec:orge9a8306"
    "sec:org0d16962"
    "sec:org48514bf"
    "sec:org3c0dddd"
    "sec:org7ce8ed3"
    "sec:org256bd4f"
    "sec:orgcc90530"
    "sec:org10f0792"
    "sec:org12add91"
    "sec:org88c2789"
    "sec:org6502bf2"
    "sec:orgc7d5d7a"
    "sec:orgbeae773"
    "sec:org66245df"
    "sec:org7ca4f3a"
    "sec:org27bac3e"
    "sec:org93c9e85"
    "sec:org374e250"
    "sec:orgb222f43"
    "sec:orge99a739"
    "sec:org356370a"
    "sec:org06171a9"
    "sec:org0709fb6"
    "sec:orgce317dd"
    "sec:orgcbb7d2e"
    "sec:orgdffaf30"
    "sec:orgba742c7"
    "sec:org64d09a7"
    "sec:orgf8f6c2b"
    "sec:org3772057"
    "sec:org6e6572e"
    "sec:org7ef0ea4"
    "sec:org612c15b"
    "sec:org5387e61"
    "sec:orga28a0bc"
    "sec:org5a86826"
    "sec:org107ded2"
    "sec:org4400fa1"
    "sec:org7e5e275"
    "sec:org233152b"
    "sec:org74ad546"
    "sec:org83c498f"
    "sec:org771cf30"
    "sec:org9d02813"
    "sec:orgd3b197b"
    "sec:org48e34f8"
    "sec:orgd33a62b"))
 :latex)
