(defun single? (lst)
  "Returns true when its argument is
is a list of one element."
  (and (consp lst) (null (cdr lst))))

(defun append1 (lst obj)
  "Adds an element to the end of the
list."
  (append lst (list obj)))

(defun map-int (fn n)
  "Takes a function and an integer n,
and returns a list of the results of
calling the function on the integers
from 0 to n-1."
  (let ((acc nil))
    (dotimes (i n)
      (push (funcall fn i) acc))
    ;; nreverse do the same thing as
    ;; reverse, but is more efficient.
    (nreverse acc)))

(defun filter (fn lst)
  "Takes a function and a list, and
return all the non-nil values returned
by the function as it is applied to the
elements of the list."
  (let ((acc nil))
    (dolist (x lst)
      (let ((val (funcall fn x)))
	(if val
	    (push val acc))))
    (nreverse acc)))


(defun most (fn lst)
  "Returns the element of a list with
the highest score according to some
scoring function. It returns two values,
the winning element and its score."
  (if (null lst)
      (values nil nil)
      (let* ((wins (car lst))
	     (max (funcall fn wins)))
	(dolist (obj (cdr lst))
	  (let ((score (funcall fn obj)))
	    (when (> score max)
	      (setf wins obj
		    max score))))
	(values wins max))))


