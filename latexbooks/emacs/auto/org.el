(TeX-add-style-hook
 "org"
 (lambda ()
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
   (LaTeX-add-labels
    "cha:org"
    "sec:document-structure"
    "sec:headlines-1"
    "sec:motion"
    "tab:org-motion-cmds"
    "sec:visibility-cycling"
    "tab:visibility-cycling-cmds"
    "sec:structure-editing"
    "tab:structure-editing-cmds"
    "sec:sparse-tree"
    "tab:sparse-tree-cmds"
    "sec:drawers"
    "sec:block"
    "sec:plain-lists"
    "tab:plain-list-cmds"
    "sec:checkboxes"
    "sec:hyperlinks"
    "sec:link-format"
    "sec:internal-links"
    "sec:external-links"
    "sec:handling-links"
    "sec:link-abbreviations"
    "sec:search-options-file"
    "sec:summary-1"
    "tab:hyperlinks-cmds"
    "sec:todo-items"
    "sec:basic-todo-funct"
    "tab:basic-todo-cmds"
    "sec:extended-use-todo"
    "tab:extended-todo-cmds"
    "sec:progress-logging"
    "tab:progress-logging-commands"
    "sec:priorities"
    "tab:"
    "sec:breaking-down-tasks"
    "sec:dates-times"
    "sec:timestamps"
    "sec:creating-timestamps"
    "tab:creating-timestamp-cmds"
    "tab:minibuffer-cmds"
    "sec:deadlines-scheduling"
    "sec:repeated-tasks"
    "sec:clocking-work-time"
    "sec:effort-estimates"
    "sec:relative-timer"
    "sec:tags"
    "tab:tag-cmds"
    "sec:agenda-views"
    "sec:agenda-files"
    "tab:agenda-files-cmds"
    "sec:agenda-dispatcher"
    "sec:org-roam"
    "sec:installation-2"
    "sec:basic-1"
    "sec:org-roam-node"
    "sec:links-between-nodes"
    "sec:setting-up-org"
    "sec:creat-link-nodes"))
 :latex)

