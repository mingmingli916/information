;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

?\a                                     ; control-g
?\b                                     ; backspace, BS
?\t                                     ; tab, TAB
?\n                                     ; newline
?\\                                     ; backslash character, \
?\d                                     ; delete character, DEL
?\e                                     ; escape character, ESC
?\r                                     ; carriage return, RET

?\^I                                    ; C-i
?\^i                                    ; C-i
?\C-I                                   ; C-i
?\C-i                                   ; C-i

?\M-A                                   ; M-A
?\M-\C-b                                ; C-M-b
?\C-\M-b                                ; C-M-b

\S-                                     ; shift
\H-                                     ; hyper
\s-                                     ; super
\A-                                     ; alt

foo                                     ; A symbol named 'foo'
FOO                                     ; A symbol named 'FOO'
1+                                      ; A symbol named '1+'
\+1                                     ; A symbol named '+1'
+-*/_~!@$%^&=:<>{}                      ; A symbol named '+-*/_~!@$%^&=:<>{}'


(A 2 "A")            ; A list of three elements.                      
()                   ; A list of no elements (the empty list).        
nil                  ; A list of no elements (the empty list).        
("A ()")             ; A list of one element: the string "A ()".      
(A ())               ; A list of two elements: A and the empty list.  
(A nil)              ; Equivalent to the previous.                    
((A B C))            ; A list of one element (which is a list of three elements).           
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
(setq alist-of-colors
      '((rose . red) (lily . white) (buttercup . yellow)))


"\t"                                    ; tab
"\C-a"                                  ; C-a

[1 "two" (three)]                       ; A vector of three elements.


(make-bool-vector 3 t)                  ; #&3""
(make-bool-vector 3 nil)                ; #&3" "


(equal #&3"\077" #&3"\007")             ; t

;; symbol-function: access the function cell of the symbol
(symbol-function 'car)                  ; #<subr car>
;; To check if it is a primitive function.
(subrp (symbol-function 'car))          ; t


(make-finalizer function)

(current-buffer)                        ; #<buffer *scratch*>

(point-marker)                          ; #<marker at 3035 in *scratch*>

(selected-window)                       ; #<window 3 on *scratch*>

(selected-frame)                        ; #<frame *scratch* 0x7fdcdc0e2630>

(get-device-terminal nil)               ; #<terminal 1 on Mingmings-MacBook-Pro.local>

(process-list)                          ; (#<process shell> #<process server> #<process ispell>)

(all-threads)                           ; (#<thread 0x10b588b80>)

(make-mutex "my-mutex")                 ; #<mutex my-mutex>
(make-mutex)                            ; #<mutex 0x7fdcdf9deb60>


(make-condition-variable (make-mutex))  ; #<condvar 0x7fdcdfd33980>

(setq foo (make-overlay 1 10)) ; #<overlay from 1 to 10 in scratch.el>


(symbol-value 'lisp-mode-map)
;; (keymap
;;  (3 keymap
;;     ;; C-c C-z
;;     (26 . run-lisp))
;;  (27 keymap
;;      ;; C-M-x, treated as ESC C-x
;;      (24 . lisp-send-defun))
;;  ;; This part is inherited from lisp-mode-shared-map. keymap
;;  ;; DEL
;;  (127 . backward-delete-char-untabify)
;;  (27 keymap
;;      ;; C-M-q, treated as ESC C-q
;;      (17 . indent-sexp)))


;; make a list in which the first element recurs as the third element
(#1=(a) b #1#)

;; This differs from ordinary syntax such as this
((a) b (a))
;; which would result in a list whose first and third elements look alike but are not the same Lisp object. 

(prog1 nil
  (setq x '(#1=(a) b #1#)))
(eq (nth 0 x) (nth 2 x))                ; t

(setq x '((a) b (a)))
(eq (nth 0 x) (nth 2 x))                ; nil

;; This makes a list whose second element is the list itself.
#1=(a #1#)

;; binary
#b101100                                ; 44
;; octal
#o54                                    ; 44
;; hex
#x2c                                    ; 44
;; #radix r integer, radix=24
#24r1k                                  ; 44

(max-char)


most-positive-fixnum                    ; 2305843009213693951
most-negative-fixnum                    ; -2305843009213693952
;; Maximum number N of bits in safely-calculated integers.
integer-width                           ; 65536

;; read syntaxes for special floating-point values.
1.0e+INF                                ; 1.0e+INF
-1.0e+INF                               ; -1.0e+INF
0.0e+NaN                                ; 0.0e+NaN
-0.0e+NaN                               ; -0.0e+NaN


(floor 1.1)                             ; 1
(ffloor 1.1)                            ; 1.0




;; -7 = ...111111111111111111111111111001
(ash -7 -1)                   ; -4 = ...111111111111111111111111111100
(lsh -7 -1)           ; 536870908  = ...011111111111111111111111111100


(make-string 5 ?x)                      ; "xxxxx"


(string ?a ?b ?c)                       ; "abc"

(substring "abcdefg" 0 3)               ; "abc"
(substring "abcdefg" -3 -1)             ; "ef"
(substring "abcdefg" -3 nil)            ; "efg"
(substring "abcdefg" 0)                 ; "abcdefg"


(concat "abc" "-def")                   ; "abc-def"
(concat "abc" (list 120 121) [122])     ; "abcxyz"
(concat "abc" nil "-def")               ; "abc-def"
(concat)                                ; ""

(split-string " two words ")            ; ("two" "words")
(split-string "  two words "
              split-string-default-separators) ; ("" "two" "words" "")
(split-string "Soup is good food" "o")         ; ("S" "up is g" "" "d f" "" "d")
(split-string "Soup is good food" "o" t)       ; ("S" "up is g" "d f" "d")
(split-string "Soup is good food" "o+")        ; ("S" "up is g" "d f" "d")


(compare-strings "hello ming" nil nil "hello a!" nil nil)

(format "hello, '%s'" "Ming")           ; "hello, 'Ming'"
(format-message "hello, '%s'" "Ming")   ; "hello, ’Ming’"


(format "%s" "hello")                   ; "hello"
(format "%S" "hello")                   ; "\"hello\""

(format "%% %d" 30)                     ; "% 30"

(format "The octal value of %d is %o, and the hex value is %x." 18 18 18)
;;  "The octal value of 18 is 22, and the hex value is 12."

(format-message
 "The name of this buffer is ‘%s’." (buffer-name))
;;  "The name of this buffer is ‘scratch.el’."

(format-message
 "The buffer object prints as `%s'." (current-buffer))
;;  "The buffer object prints as ‘scratch.el’."



(format "%2$s, %3$s, %%, %1$s" "x" "y" "z")
;;  "y, z, %, x"



(format "%06d is padded on the left with zeros" 123)
;;  "000123 is padded on the left with zeros"
(format "'%-6d' is padded on the right" 123)
;;  "'123   ' is padded on the right"
(format "The word '%-7s' actually has %d letters in it."
        "foo" (length "foo"))
;;  "The word 'foo    ' actually has 3 letters in it."


(format "%5d is padded on the left with spaces" 123)
;;  "  123 is padded on the left with spaces"
(format "The word '%7s' has %d letters in it."
        "specification" (length "specification"))
;;  "The word 'specification' has 13 letters in it."

        
(format-spec "foo %b bar" '((?b . "zot")) nil t)
;; ("foo " "zot" " bar")


(setq my-site-info
      (list (cons ?s system-name)
            (cons ?t (symbol-name system-type))
            (cons ?c system-configuration)
            (cons ?v emacs-version)
            (cons ?e invocation-name)
            (cons ?p (number-to-string (emacs-pid)))
            (cons ?a user-mail-address)
            (cons ?n user-full-name)))

(format-spec "%e %v (%c) Emacs User: %n" my-site-info)
;; "Emacs-x86_64-10_14 28.2 (x86_64-apple-darwin18.7.0) Emacs User: Mingming Li"


(setq my-battery-info
      (list (cons ?p "73")      ; Percentage
            (cons ?L "Battery") ; Status
            (cons ?t "2:23")    ; Remaining time
            (cons ?c "24330")   ; Capacity
            (cons ?r "10.6")))  ; Rate of discharge

(format-spec "%>^-3L : %3p%% (%05t left)" my-battery-info)
;; "BAT :  73% (02:23 left)"

;; downcase
(downcase "The cat in the hat")         ; "the cat in the hat"
(downcase ?X)                           ; 120

;; upcase
(upcase "The cat in the hat")           ; "THE CAT IN THE HAT"
(upcase ?x)                             ; 88

;; capitalize
(capitalize "The cAt in the hat")       ; "The Cat In The Hat"
(capitalize ?x)                         ; 88

;; upcase-initials
(upcase-initials "The cAt in the hat")  ; "The CAt In The Hat"
(upcase-initials ?x)                    ; 88

(standard-case-table)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(cons 1 '(2))                           ; (1 2)
(cons 1 '())                            ; (1)
(cons 1 2)                              ; (1 . 2)

(list 1 2 3 4 5)                        ; (1 2 3 4 5)
(list 1 2 '(3 4 5) 'foo)                ; (1 2 (3 4 5) foo)
(list)                                  ; nil

(make-list 3 'pigs)                     ; (pigs pigs pigs)

(setq trees '(pine oak))                ; (pine oak)
(setq more-trees (append '(maple birch) trees)) ; (maple birch pine oak)
trees                                           ; (pine oak)
more-trees                                      ; (maple birch pine oak)
(append [a b] "cd" nil)                         ; (a b 99 100)
(append)                                        ; nil
(append '(x y) 'z)                              ; (x y . z)

(flatten-tree '(1 (2 . 3) nil (4 5 (6)) 7)) ; (1 2 3 4 5 6 7)

(number-sequence 1.5 6 2)               ; (1.5 3.5 5.5)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq l '(a b))                         ; (a b)
(push 'c l)                             ; (c a b)
l                                       ; (c a b)

(setq foo '(a b))                       ; (a b)
(add-to-list 'foo 'c)                   ; (c a b)
(add-to-list 'foo 'b)                   ; (c a b)
foo                                     ; (c a b)
(add-to-list 'foo 'd t)                 ; (c a b d)

(setq foo '())                          ;  nil
(add-to-ordered-list 'foo 'a 1)         ; (a)
(add-to-ordered-list 'foo 'c 3)         ; (a c)
(add-to-ordered-list 'foo 'b 2)         ; (a b c)
(add-to-ordered-list 'foo 'b 4)         ; (a c b)
(add-to-ordered-list 'foo 'd)           ; (a c b d)
(add-to-ordered-list 'foo 'e)           ; (a c b e d)
foo                                     ; (a c b e d)

(setq x (list 1 2))                     ; (1 2)
(setcar x 4)                            ; 4
x                                       ; (4 2)

;; Create two lists that are partly shared.
(setq x1 (list 'a 'b 'c))               ; (a b c)
(setq x2 (cons 'z (cdr x1)))            ; (z b c)
;; Replace the car of a shared link.
(setcar (cdr x1) 'foo)                  ; foo
x1                                      ; (a foo c)
x2                                      ; (z foo c)
;; Replace the car of a link that is not shared.
(setcar x1 'baz)                        ; baz
x1                                      ; (baz foo c)
x2                                      ; (z foo c)

(setq x (list 1 2 3))                   ; (1 2 3)
(setcdr x '(4))                         ; (4)
x                                       ; (1 4)

(setq x1 (list 'a 'b 'c))               ;  (a b c)
(setcdr x1 (cdr (cdr x1)))              ; (c)
x1                                      ; (a c)

(setq x1 (list 'a 'b 'c))               ; (a b c)
(setcdr x1 (cons 'd (cdr x1)))          ; (d b c)
x1                                      ; (a d b c)

(setq x (list 1 2 3))                   ; (1 2 3)
(nconc x '(4 5))                        ; (1 2 3 4 5)
x                                       ; (1 2 3 4 5)


(memq 'b '(a b c b a))                  ; (b c b a)


(delq 'a '(a b c))                      ; (b c)

(setq sample-list (list 'a 'b 'c '(4))) ; (a b c (4))
(delq 'a sample-list)                   ; (b c (4))
sample-list                             ; (a b c (4))
(delq 'c sample-list)                   ; (a b (4))
sample-list                             ; (a b (4))

(setq sample-list (list 'a 'b 'c 'a 'b 'c)) ; (a b c a b c)
(remq 'a sample-list)                       ; (b c b c)
sample-list                                 ; (a b c a b c)

(memql 1.2 '(1.1 1.2 1.3))              ; (1.2 1.3)
(memq 1.2 '(1.1 1.2 1.3))               ; nil

(member '(2) '((1) (2)))                ; ((2))
(memq '(2) '((1) (2)))                  ; nil

(setq l (list '(2) '(1) '(2)))          ; ((2) (1) (2))
(delete '(2) l)                         ; ((1))
l                                       ; ((2) (1))

(setq l [(2) (1) (2)])                  ; [(2) (1) (2)]
(delete '(2) l)                         ; [(1)]
l                                       ; [(2) (1) (2)]

(setq trees '((pine . cones) (oak . acorns) (maple . seeds)))
;; ((pine . cones) (oak . acorns) (maple . seeds))
(assoc 'oak trees)
;;  (oak . acorns)
(cdr (assoc 'oak trees))
;;  acorns
(assoc 'birch trees)
;;  nil


(setq alist (list '(foo 1) '(bar 2) '(foo 3) '(lose 4)))
;;  ((foo 1) (bar 2) (foo 3) (lose 4))
(assq-delete-all 'foo alist)
;;  ((bar 2) (lose 4))
alist
;;  ((foo 1) (bar 2) (lose 4))

(setq colors '((rose . red) (lily . white) (buttercup . yellow)))
;;  ((rose . red) (lily . white) (buttercup . yellow))
(let-alist colors
  (if (eq .rose 'red)
      .lily))
;;  white

(setq colors '((rose . red) (lily (belladonna . yellow) (brindisi . pink))))
;;  ((rose . red) (lily (belladonna . yellow) (brindisi . pink)))
(let-alist colors
  (if (eq .rose 'red)
      .lily.belladonna))
;;  yellow


(plist-get '(foo 4) 'foo)               ; 4
(plist-get '(foo 4 bad) 'foo)           ; 4
(plist-get '(foo 4 bad) 'bad)           ; nil

(setq my-plist (list 'bar t 'foo 4))    ; (bar t foo 4)
(setq my-plist (plist-put my-plist 'foo 69)) ; (bar t foo 69)
(setq my-plist (plist-put my-plist 'quux '(a))) ; (bar t foo 69 quux (a))


(plist-get '(foo 4 bad) 'bad)           ; nil
(plist-get '(foo 4 bad) 'bar)           ; nil
(plist-member '(foo 4 bad) 'bad)        ; (bad)
(plist-member '(foo 4 bad) 'bar)        ; nil


(elt [1 2 3 4] 2)                       ;3
(seq-elt [1 2 3 4] 2)                   ;3

(setq vec [1 2 3 4])                    ;[1 2 3 4]
(setf (seq-elt vec 2) 5)                ;5
vec                                     ;[1 2 5 4]



(setq vec [1 2 3 4])                    ;[1 2 3 4]
(setf (elt vec 2) 5)                    ;5
vec                                     ;[1 2 5 4]


(length '(1 2 3))                       ; 3

(elt '(1 2 3 4) 2)                      ; 3


(seq-drop [1 2 3 4 5 6] 3)              ; [4 5 6]

(seq-take '(1 2 3 4) 3)                 ; (1 2 3)


(seq-take-while (lambda (elt) (> elt 0)) '(1 2 3 -1 -2))
                                        ; (1 2 3)


(seq-map #'1+ '(2 4 6))                 ; (3 5 7)

(seq-map-indexed (lambda (elt idx)
                   (list idx elt))
                 '(a b c))
;;  ((0 a) (1 b) (2 c))

(seq-mapn #'+ '(2 4 6) '(20 40 60))
;;  (22 44 66)


(seq-filter (lambda (elt) (> elt 0)) [1 -1 3 -3 5])
;;  (1 3 5)

(seq-remove (lambda (elt) (> elt 0)) [1 -1 3 -3 5])
;;  (-1 -3)

(seq-reduce #'+ '(1 2 3 4) 5)
;;  15

(seq-some #'numberp ["abc" 1 nil])      ; t
(seq-some #'1+ [2 4 6])                 ; 3


(seq-find #'numberp ["abc" 1 nil])      ; 1

(seq-every-p #'numberp [2 4 6])         ; t
(seq-every-p #'numberp [2 4 "6"])       ; nil

(seq-count (lambda (elt) (> elt 0)) [-1 2 0 3 -1]) ; 2

(seq-sort #'> '(1 2 3 4))               ; (4 3 2 1)

(seq-sort-by #'seq-length #'> ["a" "ab" "abc"])
;;  ["abc" "ab" "a"]


(seq-contains-p '(symbol1 symbol2) 'symbol1) ; t
(seq-contains-p '(symbol1 symbol2) 'symbol3) ; nil


(seq-set-equal-p '(a b c) '(c b a))
;;  t
(seq-set-equal-p '(a b c) '(c b))
;;  nil
(seq-set-equal-p '("a" "b" "c") '("c" "b" "a"))
;;  t
(seq-set-equal-p '("a" "b" "c") '("c" "b" "a") #'eq)
;;  nil

(seq-position '(a b c) 'b)              ; 1
(seq-position '(a b c) 'd)              ; nil

(seq-uniq '(1 2 2 1 3))                 ; (1 2 3)
(seq-uniq '(1 2 2.0 1.0) #'=)           ; (1 2)
(seq-uniq '(1 2 2.0 1.0))               ; (1 2 2.0 1.0)

(seq-subseq '(1 2 3 4 5) 1)
;;  (2 3 4 5)
(seq-subseq '[1 2 3 4 5] 1 3)
;;  [2 3]
(seq-subseq '[1 2 3 4 5] -3 -1)
;;  [3 4]

(seq-concatenate 'list '(1 2) '(3 4) [5 6])
;;  (1 2 3 4 5 6)
(seq-concatenate 'string "Hello " "world")
;;  "Hello world"


(seq-mapcat #'seq-reverse '((3 2 1) (6 5 4)))
;;  (1 2 3 4 5 6)

(seq-partition '(0 1 2 3 4 5 6 7) 3)
;;  ((0 1 2) (3 4 5) (6 7))


(seq-union [1 2 3] [3 5])
;;  (1 2 3 5)



(seq-intersection [2 3 4 5] [1 3 5 6 7])
;;  (3 5)

(seq-difference '(2 3 4 5) [1 3 5 6 7])
;;  (2 4)

(seq-group-by #'integerp '(1 2.1 3 2 3.2))
;;  ((t 1 3 2) (nil 2.1 3.2))
(seq-group-by #'car '((a 1) (b 2) (a 3) (c 4))) 
;;  ((b (b 2)) (a (a 1) (a 3)) (c (c 4)))


(seq-into [1 2 3] 'list)
;;  (1 2 3)
(seq-into nil 'vector)
;;  []
(seq-into "hello" 'vector)
;;  [104 101 108 108 111]


(seq-let [first second] [1 2 3 4]
  (list first second))
;;  (1 2)
(seq-let (_ a _ b) '(1 2 3 4)
  (list a b))
;;  (2 4)
(seq-let [a [b [c]]] [1 [2 [3]]]
  (list a b c))
;;  (1 2 3)
(seq-let [a b &rest others] [1 2 3 4]
  others)
;;  [3 4]

(let ((a nil)
      (b nil))
  (seq-setq (_ a _ b) '(1 2 3 4))
  (list a b))
;;  (2 4)


(seq-random-elt [1 2 3 4])              ; 3
(seq-random-elt [1 2 3 4])              ; 3
(seq-random-elt [1 2 3 4])              ; 3
(seq-random-elt [1 2 3 4])              ; 1
(seq-random-elt [1 2 3 4])              ; 2


(setq a (copy-sequence [a b c d e f g])) ; need to be mutable
;; [a b c d e f g]
(fillarray a 0)
;; [0 0 0 0 0 0 0]
a
;; [0 0 0 0 0 0 0]


(vector 'foo 23 [bar baz] "rats")
;; [foo 23 [bar baz] "rats"]
(vector)
;; []

(setq sleepy (make-vector 9 'Z))
;; [Z Z Z Z Z Z Z Z Z]

(setq a (vconcat '(A B C) '(D E F)))
;; [A B C D E F]
(eq a (vconcat a))
;; nil
(vconcat [A B C] "aa" '(foo (6 7)))
;; [A B C 97 97 foo (6 7)]


(bool-vector t nil t nil)               ; #&4""
(bool-vector)                           ; #&0""

;; You can use vconcat to print a bool-vector like other vectors:
(vconcat (bool-vector nil t nil t))
;; [nil t nil t]


(record 'foo 23 [bar baz] "rats")
;; #s(foo 23 [bar baz] "rats")


(setq sleepy (make-record 'foo 9 'Z))
;; #s(foo Z Z Z Z Z Z Z Z Z)
