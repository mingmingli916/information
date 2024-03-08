;; In some applications it's useful to able
;; to add and subtract dates - to be able
;; calculate, for example, that the date 60
;; days after December 17,1997 is February 15,
;; 1998.


;; We will convert dates to inegers, with
;; zero fixed at January 1, 2000.

;; non-leap year.
;; (setf mon '(31 28 31 30 31 30 31 31 30 31 30 31))
;; (setf nom (reverse mon))
;; (setf sums (maplist #'(lambda (x)
;; 			(apply #'+ x))
;; 		    nom))
;; (setf sums (reverse sums))
;; (31 59 90 120 151 181 212 243 273 304 334 365)

;; Define a simple vector
(defconstant month
  #(0 31 59 90 120 151 181 212 243 273 304 334 365))


(defconstant yzero 2000)		;year zero

;; Return true if year is a leap year.
(defun leap? (y)
  (and (zerop (mod y 4))
       (or (zerop (mod y 400))
	   (not (zerop (mod y 100))))))

;; Convert date to days
(defun date->num (d m y)
  (+ (- d 1) (month-num m y) (year-num y)))

;; Convert month to days
(defun month-num (m y)
  (+ (svref month (- m 1))
     (if (and (> m 2)
	      (leap? y))
	 1
	 0)))

;; Convert year to days
(defun year-num (y)
  (let ((d 0))
    (if (>= y yzero)
	(dotimes (i (- y yzero) d)
	  (incf d (year-days (+ yzero i))))
	(dotimes (i (- yzero y) (- d))
	  (incf d (year-days (+ y i)))))))

;; Return the days in a year.
(defun year-days (y)
  (if (leap? y)
      366
      365))


;; Convert days to date
(defun num->date (n)
  (multiple-value-bind (y left) (num-year n)
    (multiple-value-bind (m d) (num-month left y)
      (values d m y))))

;; According to days, get the year part.
(defun num-year (n)
  (if (< n 0)
      (do* ((y (- yzero 1) (- y 1))
	    (d (- (year-days y)) (- d (year-days y))))
	   ((<= d n) (values y (- n d))))
      (do* ((y yzero (+ y 1))
	    (prev 0 d)
	    (d (year-days y) (+ d (year-days y))))
	   ((> d n) (values y (- n prev))))))

;; According to month days, get the month and day part.
(defun num-month (n y)
  (if (leap? y)
      (cond ((= n 59) (values 2 29))
	    ((> n 59) (nmon (- n 1)))
	    (t (nmon n)))
      (nmon n)))


(defun nmon (n)
  (let ((m (position n month :test #'<)))
    (values m (+ 1 (- n (svref month (- m 1)))))))

;; Get the corresponding date after n days relative
;; to d(day), m(month), y(year).
(defun date+ (d m y n)
  (num->date (+ (date->num d m y) n)))
