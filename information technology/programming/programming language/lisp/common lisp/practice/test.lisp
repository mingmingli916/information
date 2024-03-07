;; (progn
;;   (setf *print-circle* t)
;;   (defstruct my-elt
;;     (parent nil)
;;     (child nil))
;;   (let ((c (make-my-elt))
;; 	(p (make-my-elt)))
;;     (setf (my-elt-parent c) p
;; 	  (my-elt-child p) c)
;;     c))


;; (deftype multiple-of (n)
;;   `(and integer (satisfies (lambda (x)
;; 			     (zerop (mod x ,n))))))
;; (typep 12 '(multiple-of 4))


;; (deftype multiple-of (n)
;;   (let ((my-predicate (gensym)))
;;     (setf (symbol-function my-predicate)
;; 	  #'(lambda (x)
;; 	      (zerop (mod x n))))
;;     `(and integer (satisfies ,my-predicate))))


;; (typep 12 '(multiple-of 5))

;; (defun copy-file (from to)
;;   (with-open-file (in from :direction :input
;; 			   :element-type 'unsigned-byte)
;;     (with-open-file (out to :direction :output
;; 			    :element-type 'unsigned-byte)
;;       (do ((i (read-byte in nil -1) (read-byte in nil -1)))
;; 	  ((minusp i))
;; 	(declare (fixnum i))
;; 	(write-tye i out)))))


;; (set-macro-character #\'
;; 		     #'(lambda (stream char)
;; 			 (list (quote quote) (read stream t nil t))))

;; (set-dispatch-macro-character #\# #\?
;; 			      #'(lambda (stream char1 char2)
;; 				  (list 'quote
;; 					(let ((lst nil))
;; 					  (dotimes (i (+ (read stream t nil t) 1))
;; 					    (push i lst))
;; 					  (nreverse lst)))))



;; (set-macro-character #\}
;; 		     (get-macro-character #\)))

;; (set-dispatch-macro-character #\# #\{
;; 			      #'(lambda (stream char1 char2)
;; 				  (let ((accum nil)
;; 					(pair (read-delimited-list #\} stream t)))
;; 				    (do ((i (car pair) (+ i 1)))
;; 					((> i (cadr pair))
;; 					 (list 'quote (nreverse accum)))
;; 				      (push i accum)))))



(let ((sandwich '(ham on rye)))
	   (assert (eql (car sandwich) 'chicken)
		   ((car sandwich))
		   "I want a ~A sandwich." 'chicken)
	   sandwich)




