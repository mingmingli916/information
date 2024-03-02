;; This is a inefficient algorithm right now.
;; It does not compress as tightly as it could,
;; and it only works for lists of atoms.


(defun n-elts (elt n)
  "If there are more than one the same
elements occurs several in a row, return
(n elt) otherwise elt."
  (if (> n 1)
      (list n elt)
      elt))

(defun compr (elt n lst)
  "It takes three argument: `elt`, the element
in a list, `n`, the number of times in a row,
and `lst`, the part of the list to examine."
  (if (null lst)
      (list (n-elts elt n))
      (let ((next (car lst)))
	;; If the first element of list is still elt,
	;; increment `n` and keep going.
	(if (eql next elt)
	    (compr elt (+ n 1) (cdr lst))
	    ;; Otherwise cons the compressed list
	    ;; onto whatever `compr` returns for the
	    ;; rest of the list
	    (cons (n-elts elt n)
		  (compr next 1 (cdr lst)))))))


(defun compress (x)
  "Takes a list of atoms and returns a
compressed representation of it.
Whenever the same element occurs several
times in a row, the sequence is replaced
by a list indicating the element and the
number of occurrences."
  (if (consp x)
      (compr (car x) 1 (cdr x))
      x))



(defun uncompress (lst)
  (if (null lst)
      nil
      (let ((elt (car lst))
	    (rest (uncompress (cdr lst))))
	(if (consp elt)
	    (append (apply #'list-of elt)
		    rest)
	    (cons elt rest)))))

(defun list-of (n elt)
  (if (zerop n)
      nil
      (cons elt (list-of (- n 1) elt))))


