(defun compose (&rest fns)
  "Takes one or more functions and returns a new
function in which all of them applied in succession."
  (destructuring-bind (fn1 . rest) (reverse fns)
    #'(lambda (&rest args)
	(reduce #'(lambda (v f)
		    (funcall f v))
		rest
		:initial-value (apply fn1 args)))))


(defun disjoin (fn &rest fns)
  "Takes one or more predicates as arguments and
returns a predicate that returns true when any of
the predicates return true."
  (if (null fns)
      fn
      (let ((disj (apply #'disjoin fns)))
	#'(lambda (&rest args)
	    (or (apply fn args)
		(apply disj args))))))


(defun conjoin (fn &rest fns)
  "Takes one or more predicate as argument and
returns a predicate that returns true when all of
the predicates return true. "
  (if (null fns)
      fn
      (let ((conj (apply #'conjoin fns)))
	#'(lambda (&rest args)
	    (and (apply fn args)
		 (apply conj args))))))


(defun curry (fn &rest args)
  "Takes a function and some of argument and
return a new function that expects the rest of
arguments."
  #'(lambda (&rest args2)
      (apply fn (append args args2))))


(defun rcurry (fn &rest args)
  "Takes a function and some of argument and
return a new function that expects the rest of
arguments."
  #'(lambda (&rest args2)
      (apply fn (append args2 args))))


(defun always (x)
  "It takes an argument and returns a function
that returns it. It is useful mainly in situations
where functional arguments are required."
  #'(lambda (&rest args)
      x))




;; CL-USER> (mapcar (compose #'list #'round #'sqrt)
;; 		 '(4 9 16 25 27))
;; ((2) (3) (4) (5) (5))
;; CL-USER> (mapcar (disjoin #'integerp #'symbolp)
;; 		 '(a "a" 2 3))
;; (T NIL T T)
;; CL-USER> (funcall (curry #'+ 1 2 3) 4 5 6)
;; 21
;; CL-USER> (funcall (rcurry #'+ 1 2 3) 4 5 6)
;; 21
;; CL-USER> (funcall (curry #'- 3) 2)
;; 1
;; CL-USER> (funcall (rcurry #'- 3) 2)
;; -1
;; CL-USER> (funcall (always 1))
;; 1





