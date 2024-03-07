(TeX-add-style-hook
 "deep-unsupervised-learning-using-nonequilibrium-thermodynamics"
 (lambda ()
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (LaTeX-add-labels
    "cha:deep-unsup-learn"
    "sec:algorithm"
    "sec:forward-trajectory"
    "eq:18"
    "eq:29"
    "eq:30"
    "sec:reverse-trajectory"
    "eq:31"
    "eq:32"
    "sec:model-probability"
    "eq:33"
    "eq:34"
    "sec:training"
    "eq:35"
    "eq:37"
    "eq:36"
    "eq:39"
    "eq:38"))
 :latex)

