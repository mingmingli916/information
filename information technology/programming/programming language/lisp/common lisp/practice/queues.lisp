(defun make-queue ()
  (cons nil nil))

(defun enqueue (obj q)
  (if (null (car q))
      (setf (cdr q) (setf (car q) (list obj)))
      (setf (cdr (cdr q)) (list obj)
	    (cdr q) (cdr (cdr q))))
  (car q))

(defun dequeue (q)
  (pop (car q)))



(setf q1 (make-queue))
;; (NIL)
(progn (enqueue 'a q1)
       (enqueue 'b q1)
       (enqueue 'c q1))
;; (A B C)
q1
;; ((A B C) C)
(dequeue q1)
;; A
(dequeue q1)
;; B
(enqueue 'd q1)
;; (C D)
q1
;; ((C D) D)

