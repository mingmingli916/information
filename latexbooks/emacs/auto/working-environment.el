(TeX-add-style-hook
 "working-environment"
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
    "cha:emacs-as-working"
    "tab:ispell-commands"
    "tab:ispell-options"
    "sec:flyspell-1"
    "tab:flyspell-commands"
    "sec:bookmarks"
    "sec:bookmark-commands"
    "tab:bookmark-commands"
    "sec:bookmark-list"
    "tab:bookmark-list-commands"
    "sec:shell"
    "sec:one-command-at"
    "tab:one-command-at-a-time"
    "sec:shell-mode"
    "tab:shell-mode-commands"
    "sec:eshell"
    "sec:directory-editor"
    "tab:dired-commands"
    "sec:calendar"
    "tab:calendar-commands"))
 :latex)

