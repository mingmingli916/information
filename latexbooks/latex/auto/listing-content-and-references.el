(TeX-add-style-hook
 "listing-content-and-references"
 (lambda ()
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "index")
   (TeX-add-symbols
    '("main" 1))
   (LaTeX-add-labels
    "cha:list-cont-refer"
    "sec:table-content"
    "tab:depth-of-toc"
    "sec:adding-entr-manu"
    "sec:creat-cust-lists"
    "sec:creat-cust-lists-1"
    "sec:generating-an-index"
    "item:1"
    "sec:spec-page-rang"
    "sec:using-symbols-macros"
    "sec:referr-other-index"
    "sec:fine-tuning-page"
    "sec:design-index-layo"
    "sec:creat-bibl"
    "sec:using-bibl-datab"
    "sec:changing-headings"
    "tab:headings"
    "tab:macros-name")
   (LaTeX-add-bibitems
    "key"
    "DK86"
    "DK89")
   (LaTeX-add-bibliographies
    "latex")
   (LaTeX-add-index-entries
    "entry"
    "enterprise"
    "entry!subentry"
    "enterprise!organization"
    "entry!subentry!subsubentry"
    "enterprise!organization!operation"
    "network|("
    "network|)"
    "Gamma@$\\Gamma$"
    "network|see{WLAN}"
    "WLAN"
    "WLAN|main"))
 :latex)

