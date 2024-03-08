;; Programs that have to control the way
;; in which their arguments are evaluated
;; should be define as macros not functions.


(defmacro for (var start stop &body body)
  (let ((gstop (gensym)))
    `(do ((,var ,start (1+ ,var))
	  (,gstop ,stop))
	 ((> ,var ,gstop))
       ,@body)))

(defmacro in (obj &rest choices)
  (let ((insym (gensym)))
    `(let ((,insym ,obj))
       (or ,@(mapcar #'(lambda (c)	
			 `(eql ,insym ,c))
		     choices)))))

(defmacro random-choice (&rest exprs)
  `(case (random ,(length exprs))
     ,@(let ((key -1))
	 (mapcar #'(lambda (expr)
		     `(,(incf key) ,expr))
		 exprs))))



;; This macro can be defined as a function.
;; Sometimes you may want to define an
;; operator as a macro in order to make
;; it do some of its work at compile-time.
;; We could write avg as a function
;; (defun avg (&rest args)
;;   (/ (apply #'+ args) (length args)))
;; but then it would have to find the number
;; of arguments at run time.
(defmacro avg (&rest args)
  `(/ (+ ,@args) ,(length args)))


(defmacro with-gensyms (syms &body body)
  `(let ,(mapcar #'(lambda (s)
		     `(,s (gensym)))
	  syms)
     ,@body))


;; Intentional variable capture.
;; It allows us to use the variable `it`
;; to refer to the value returned by the
;; test argument in a conditional.
(defmacro aif (test then &optional else)
  `(let ((it ,test))
     (if it
	 ,then
	 ,else)))
