(TeX-add-style-hook
 "deep-learning"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("book" "a4paper" "10pt")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "preamble"
    "title"
    "introduction"
    "machine-learning-basics"
    "fc"
    "cnn"
    "text-preprocessing"
    "language-model"
    "rnn"
    "cv-classification"
    "object-detection"
    "segmentation"
    "generative-model"
    "nlp-classification"
    "chat"
    "book"
    "bk10")
   (LaTeX-add-labels
    "part:basics"
    "part:build-mach-learn"
    "part:natur-lang-proc-1"
    "part:comp-visi-pract"
    "part:natur-lang-proc")
   (LaTeX-add-bibliographies
    "tex"))
 :latex)

