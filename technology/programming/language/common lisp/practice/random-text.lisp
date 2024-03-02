;; Define a hash table.
;; The keys in this hash table will be symbols
;; representing words, and the values will be
;; assoc-lists like the following:
;; ((|sin) . 1) (|wide| . 2) (|sights| . 1))
(defparameter *word* (make-hash-table :size 10000))


(defconstant maxword 100)

(defun read-text (pathname)
  "It takes a pathname and builds an assoc-list."
  (with-open-file (s pathname :direction :input)
    (let ((buffer (make-string maxword)) ; buffer is used to accumulate charaters
	  (pos 0))
      (do ((c (read-char s nil :eof) (read-char s nil :eof)))
	  ((eql c :eof))		;termination
	(if (or (alpha-char-p c) (char= c #\')) ; if the character is a letter of an apostrophe
	    (progn
	      (setf (aref buffer pos) c) ; accumulate the character
	      (incf pos))
	    (progn			
	      (unless (zerop pos)
		(see (intern (string-downcase ; symbol is sent to `see`
			      (subseq buffer 0 pos))))
		(setf pos 0))
	      (let ((p (punc c)))
		(if p (see p)))))))))
(defun punc (c)
  (case c
    (#\. '|.|)
    (#\, '|,|)
    (#\; '|;|)
    (#\! '|!|)
    (#\? '|?|)))

(let ((prev '|.|))
  (defun see (symb)			; closure
    "It registers each word seen."
    (let ((pair (assoc symb (gethash prev *word*))))
      (if (null pair)
	  (push (cons symb 1) (gethash prev *word*))
	  (incf (cdr pair))))
    (setf prev symb)))


(defun generate-text (n &optional (prev '|.|))
  (if (zerop n)
      (terpri)
      (let ((next (random-next prev)))
	(format t "~A " next)
	(generate-text (1- n) next))))

(defun random-next (prev)
  (let* ((choices (gethash prev *word*))
	 (i (random (reduce #'+ choices :key #'cdr))))
    (dolist (pair choices)
      (if (minusp (decf i (cdr pair)))
	  (return (car pair))))))
