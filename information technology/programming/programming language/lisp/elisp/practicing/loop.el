
(setq animals '(dog cat pig))

(defun print-elements-of-list (list)
  "Print each element of LIST on a line of its one."
  (while list
    (print (car list))
    (setq list (cdr list))))

(print-elements-of-list animals)

(defun triangle (number-of-rows)
  "Add up the number of pebbles in a triangle.
The first row has one pebble, the second row two pebbles,
the third row three pebbles, and so on.
The argument is NUMBER-OF-ROWS."

  (let ((total 0)
	(row-number 1))
    (while (<= row-number number-of-rows)
      (setq total (+ total row-number))
      (setq row-number (1+ row-number)))
    total))

(triangle 4)
(triangle 7)

(defun reverse-list-with-dolist (list)
  (let (value)
    (dolist (element list value)
      (setq value (cons element value)))))


animals					;(dog cat pig)
(reverse-list-with-dolist animals)
;; (pig cat dog)


(let (value)
  (dotimes (number 3)
    (setq value (cons number value)))
  value)


(defun print-elements-recursively (list)
  "Print each element of LIST on a line of its own."
  (when list
    (print (car list))
    (print-elements-recursively (cdr list))))

(print-elements-recursively animals)
