;; version 1
(defparameter *harbor* nil)

(defstruct ship
  name flag tons)

(defun enter (n f d)
  (push (make-ship :name n :flag f :tons d)
	*harbor*))

(defun find-ship (n)
  (find n *harbor* :key #'ship-name))

(defun leave (n)
  (setf *harbor*
	(delete (find-ship n) *harbor*)))





;; version 2
(defconstant pool (make-array 1000 :fill-pointer t))

(dotimes (i 1000)
  (setf (aref pool i) (make-ship)))

(defconstant harbor (make-hash-table :size 1100
				     :test #'eq))

(defun enter (n f d)
  (let ((s (if (plusp (length pool))
	       (vector-pop pool)
	       (make-ship))))
    (setf (ship-name s) n
	  (ship-flag s) f
	  (ship-tons s) d
	  (gethash n harbor) s)))

(defun find-ship (n)
  (gethash n harbor))

(defun leave (n)
  (let ((s (gethash n harbor)))
    (remhash n harbor)
    (vector-push s poll)))


;; What we're doing by using pools is taking over 
;; the job of memory management. Whether this actually
;; makes our program run faster depends on how our
;; Lisp implementation manages memory. Generally 
;; speaking, it pays to use pools only in
;; implementations with primitive garbage collectors,
;; or in real-time applications where the 
;; unpredictability of GC would be a problem.
