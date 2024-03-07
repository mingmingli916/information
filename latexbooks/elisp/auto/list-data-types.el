(TeX-add-style-hook
 "list-data-types"
 (lambda ()
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (LaTeX-add-labels
    "cha:lisp-data-types"
    "sec:print-repr-read"
    "sec:special-read-syntax"
    "sec:comments"
    "sec:programming-types"
    "sec:integer-type"
    "sec:floating-point-type"
    "sec:character-type"
    "sec:basic-char-syntax"
    "sec:gener-escape-synt"
    "sec:contr-char-synt"
    "sec:meta-char-synt"
    "sec:other-char-modif"
    "sec:symbol-type"
    "sec:sequence-types"
    "sec:cons-cell-list"
    "sec:dotted-pair-notation"
    "sec:assoc-list-type"
    "sec:array-type"
    "sec:string-type"
    "sec:syntax-strings"
    "sec:non-ascii-characters"
    "sec:nonpr-char-strings"
    "sec:text-prop-strings"
    "sec:vector-type"
    "sec:char-table-type"
    "sec:bool-vector-type"
    "sec:hash-table-type"
    "sec:function-type"
    "sec:macro-type"
    "sec:prim-funct-type"
    "sec:byte-code-function"
    "sec:record-type"
    "sec:type-descriptors"
    "sec:autoload-type"
    "sec:finalizer-type"
    "sec:editing-types"
    "sec:buffer-type"
    "sec:window-type"
    "sec:frame-type"
    "sec:termial-type"
    "sec:wind-conf-type"
    "sec:frame-conf-type"
    "sec:process-type"
    "sec:thread-type"
    "sec:mutex-type"
    "sec:cond-vari-type"
    "sec:stream-type"
    "sec:keymap-type"
    "sec:overlay-type"
    "sec:font-type"
    "sec:read-syntax-circular"
    "sec:type-predicates"
    "sec:equality-predicates"
    "sec:mutability"
    "sec:summary"))
 :latex)

