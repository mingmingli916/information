(TeX-add-style-hook
 "version-control"
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
    "cha:version-control"
    "sec:installation-1"
    "sec:basic"
    "sec:show-status-buffer"
    "sec:stage-unstage"
    "sec:commit"
    "sec:push"
    "sec:help"
    "fig:transient-commands"
    "sec:summary"
    "tab:basic-magit-commands"
    "sec:interface-concepts"
    "sec:modes-buffers"
    "tab:modes-buffers-cmds"
    "sec:sections"
    "tab:sections-cmds"
    "sec:transient-commands"
    "sec:trans-argum-buff"
    "fig:transient-commit-arguments"
    "fig:transient-log-arguments"
    "sec:running-git"
    "tab:Git-cmds"
    "sec:inspecting"
    "tab:inspecting-commands"
    "sec:manipulating"
    "tab:manipulating-cmds"
    "sec:transferring"))
 :latex)

