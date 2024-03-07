(TeX-add-style-hook
 "math"
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
    "cha:probability"
    "sec:markov-chain"
    "sec:transitions"
    "sec:discrete-time-markov"
    "eq:14"
    "sec:cont-time-mark"
    "sec:markov-kernel"
    "sec:measurable-space"
    "sec:cond-prob"
    "eq:19"
    "sec:post-prob"
    "eq:20"
    "eq:21"
    "sec:guass-distr"
    "eq:22"
    "fig:gaussian-distribution"
    "sec:laplace-distribution"
    "eq:23"
    "fig:laplace-distribution"
    "sec:monte-carlo-method"
    "sec:vari-bayes-meth"
    "eq:26"
    "sec:bayesian-probability"
    "sec:binom-distr"
    "eq:24"
    "eq:25"
    "fig:binomial-distribution"
    "sec:kullb-diverg"
    "eq:27"
    "eq:28"
    "sec:jensens-inequality"
    "eq:40"
    "fig:jenson-equality"
    "eq:41"))
 :latex)

