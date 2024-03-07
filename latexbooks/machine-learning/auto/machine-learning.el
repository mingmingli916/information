(TeX-add-style-hook
 "machine-learning"
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
    "math"
    "learning"
    "model"
    "training"
    "cost-function"
    "fc"
    "cnn"
    "metric"
    "regularization"
    "activation"
    "machine-learning-process"
    "diffusion-model"
    "pytorch"
    "numpy"
    "preprocessing"
    "deep-unsupervised-learning-using-nonequilibrium-thermodynamics"
    "book"
    "bk10")
   (LaTeX-add-labels
    "part:theory"
    "part:models"
    "part:tools"
    "part:practice"
    "part:projects"
    "part:papers")
   (LaTeX-add-bibliographies
    "refs"))
 :latex)

