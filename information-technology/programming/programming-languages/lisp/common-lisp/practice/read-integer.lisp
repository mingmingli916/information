;; This version check all the characters before building the integer.
(defun read-integer (str)
  (if (every #'digit-char-p str)
      (let ((accum 0))
	(dotimes (pos (length str) accum)
	  (setf accum (+ (* accum 10)
			 (digit-char-p (char str pos))))
	  ;; (format t "pos: ~A, accum: ~A, char: ~A~%" pos accum (char str pos)) 
	  ))
      nil))

;; This version build the integer while pasing the string.
(defun read-integer (str)
  (let ((accum 0))
    (dotimes (pos (length str) accum)
      (let ((i (digit-char-p (char str pos))))
	(if i
	    (setf accum (+ (* accum 10) i))
	    (return-from read-integer nil))))))
