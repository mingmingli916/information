(defun tokens (str test start)
  ;; Get the first element position satisfying the `test`.
  (let ((p1 (position-if test str :start start))) 
    (if p1
	;; Get the first position not satisfying the `test`.
	(let ((p2 (position-if #'(lambda (c)
				   (not (funcall test c)))
			       str :start p1)))
	  (cons (subseq str p1 p2)
		;; If not the end.
		(if p2
		    (tokens str test p2)
		    nil)))
	nil)))

;; This function is defined for use as an argument to `tokens`.
;; Graphic characters are all the characters we can see, plus
;; the space character.
(defun constituent (c)
  (and (graphic-char-p c)
       ;; Do not include space character.
       (not (char= c #\ ))))


(defun parse-date (str)
  (let ((toks (tokens str #'constituent 0)))
    (list (parse-integer (first toks))
	  (parse-month (second toks))
	  (parse-integer (third toks)))))

(defconstant month-names
  #("jan" "feb" "mar" "apr" "may" "jun"
    "jul" "aug" "sep" "oct" "nov" "dec"))

(defun parse-month (str)
  (let ((p (position str month-names :test #'string-equal)))
    (if p
	(+ p 1)
	nil)))


;; CL-USER> (parse-date "16 Aug 1980")
;; (16 8 1980)
