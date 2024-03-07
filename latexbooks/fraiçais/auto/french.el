(TeX-add-style-hook
 "french"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("ctexbook" "6pt")))
   (TeX-run-style-hooks
    "latex2e"
    "~/latex/book-preamble-chinese"
    "title"
    "前言"
    "音标"
    "字母表"
    "发音规则"
    "口音"
    "动词变位"
    "否定"
    "喜欢程度"
    "liaison"
    "特殊符号"
    "基于某个时间节点的时间"
    "比较级"
    "形容词的位置"
    "宾语代词"
    "阴阳性"
    "时间"
    "ctexbook"
    "ctexbook10"))
 :latex)

