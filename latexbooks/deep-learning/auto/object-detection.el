(TeX-add-style-hook
 "object-detection"
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
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (LaTeX-add-labels
    "sec:single-shot-detector"
    "fig:ssd"
    "sec:bounding-box"
    "fig:bounding-box"
    "sec:anchor-boxes"
    "eq:1"
    "fig:anchor-boxes"
    "sec:iou"
    "sec:label-anch-boxes"
    "item:1"
    "sec:label-class-offs"
    "eq:2"
    "sec:region-based-cnn"
    "fig:r-cnn"
    "sec:fast-r-cnn"
    "fig:fast-rcnn"
    "sec:faster-r-cnn"
    "fig:faster-rcnn"
    "sec:mask-r-cnn"
    "fig:mask-rcnn"))
 :latex)

