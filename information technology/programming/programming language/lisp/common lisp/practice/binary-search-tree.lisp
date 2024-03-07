(defstruct (node (:print-function (lambda (n s d) ;n: node, s: stream, d: depth
				    (format s "#<~A>" (node-elt n)))))
  elt
  (l nil)
  (r nil))


(defun bst-insert (obj bst <)		; < is a function symbol
  (if (null bst)
      (make-node :elt obj)
      (let ((elt (node-elt bst)))
	;; It treats BST as a set and duplicate insertions are ignored.
	(if (eql obj elt)
	    bst
	    (if (funcall < obj elt)	
		(make-node
		 :elt elt
		 :l (bst-insert obj (node-l bst) <)
		 :r (node-r bst))
		(make-node
		 :elt elt
		 :r (bst-insert obj (node-r bst) <)
		 :l (node-l bst)))))))

(defun bst-find (obj bst <)
  (if (null bst)
      nil
      (let ((elt (node-elt bst)))
	(if (eql obj elt)
	    bst
	    (if (funcall < obj elt)
		(bst-find obj (node-l bst) <)
		(bst-find obj (node-r bst) <))))))

(defun bst-min (bst)
  (and bst
       (or (bst-min (node-l bst))
	   bst)))


(defun bst-max (bst)
  (and bst
       (or (bst-max (node-r bst))
       bst)))



(defun bst-remove (obj bst <)
  (if (null bst)
      nil
      (let ((elt (node-elt bst)))
	(if (eql obj elt)
	    (percolate bst)
	    (if (funcall < obj elt)
		;; Do not alter the original tree.
		(make-node
		 :elt elt
		 :l (bst-remove obj (node-l bst) <)
		 :r (node-r bst))
		(make-node
		 :elt elt
		 :r (bst-remove obj (node-r bst) <)
		 :l (node-l bst)))))))

;; It replaces the topmost element of a BST
;; with one of its children, then replaces
;; the child with one of its children, and
;; so on.
(defun percolate (bst)
  ;; cond
  (cond ((null (node-l bst))		; if no left child
	 (if (null (node-r bst))	; and also no right child
	     nil
	     (rperc bst)))
	((null (node-r bst))		; no right child
	 (lperc bst))
	;; In order to maintain the balance of the tree
	;; percolate choose randomly if there are two childre.
	;; The expression (random 2) will return 0 or 1,
	;; so (zerop (random 2)) will return half the time.
	(t (if (zerop (random 2))	; with both children
	       (lperc bst)
	       (rperc bst)))))


(defun rperc (bst)			; right percolate
  (make-node :elt (node-elt (node-r bst))
	     :l (node-l bst)
	     :r (percolate (node-r bst))))

(defun lperc (bst)			; left percolate
  (make-node :elt (node-elt (node-l bst))
	     :l (percolate (node-l bst))
	     :r (node-r bst)))

(defun bst-traverse (fn bst)		; fn can be `princ` for example.
  (when bst
    (bst-traverse fn (node-l bst))
    (funcall fn (node-elt bst))
    (bst-traverse fn (node-r bst))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; destructive

(defun bst-insert! (obj bst <)
  (if (null bst)
      (make-node :elt obj)
      (progn (bsti obj bst <)
	     bst)))

(defun bsti (obj bst <)
  (let ((elt (node-elt bst)))
    (if (eql obj elt)
	bst
	(if (funcall < obj elt)
	    (let ((l (node-l bst)))
	      (if l
		  (bsti obj l <)
		  (setf (node-l bst) (make-node :elt obj))))
	    (let ((r (node-r bst)))
	      (if r
		  (bsti obj r <)
		  (setf (node-r bst)
			(make-node :elt obj))))))))


(defun bst-delete (obj bst <)
  (if bst
      (bstd obj bst nil nil <))
  bst)

(defun bstd (obj bst prev dir <)
  (let ((elt (node-elt bst)))
    (if (eql elt obj)
	(let ((rest (percolate! bst)))
	  (case dir
	    (:l (setf (node-l prev) rest)) ; todo :l
	    (:r (setf (node-r prev) rest))))
	(if (funcall < obj elt)
	    (if (node-l bst)
		(bstd obj (node-l bst) bst :l <))
	    (if (node-r bst)
		(bstd obj (node-r bst) bst :r <))))))

(defun percolate! (bst)
  (cond ((null (node-l bst))
	 (if (null (node-r bst))
	     nil
	     (rperc! bst)))
	((null (node-r bst)) (lperc! bst))
	(t (if (zerop (random 2))
	       (lperc! bst)
	       (rperc! bst)))))

(defun lperc! (bst)
  (setf (node-elt bst) (node-elt (node-l bst)))
  (percolate! (node-l bst)))

(defun rperc! (bst)
  (setf (node-elt bst) (node-elt (node-r bst)))
  (percolate! (node-r bst)))





(setf nums nil)
;; NIL
(dolist (x '(5 8 4 2 1 9 6 7 3))
  (setf nums (bst-insert x nums #'<)))
;; NIL
(bst-find 12 nums #'<)
;; NIL
(bst-find 4 nums #'<)
;; #<4>
(bst-min nums)
;; #<1>
(bst-max nums)
;; #<9>
(setf nums (bst-remove 2 nums #'<))
;; #<5>
(bst-find 2 nums #'<)
;; NIL
(bst-traverse #'princ nums)
;; 13456789NIL



(setf *bst* nil)
;; NIL
(dolist (x '(7 2 9 8 4 1 5 3))
  (setf *bst* (bst-insert! x *bst* #'<)))
;; NIL
(bst-traverse #'princ *bst*)
;; 12345789NIL
(setf *bst* (bst-delete 2 *bst* #'<))
;; #<7>
(bst-find 2 *bst* #'<)
;; NIL
