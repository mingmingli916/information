;; simple inheritance
(defun rget (prop obj)			; recursive get
  (multiple-value-bind (val in) (gethash prop obj)
    (if in
	(values val in)
	(let ((par (gethash :parent obj)))
	  (and par (rget prop par))))))


(defun tell (obj message &rest args)
  (apply (rget message obj) obj args))



;; multiple inheritance
(defun rget (prop obj)
  (dolist (c (precedence obj))
    (multiple-value-bind (val in) (gethash prop c)
      (if in (return (values val in))))))

(defun precedence (obj)
  (labels ((traverse (x)
	     (cons x
		   (mapcan #'traverse
			   (gethash :parents x)))))
    (delete-duplicates (traverse obj))))


;; Defining Objects
(defvar *objs* nil)

(defun parents (obj)
  "Retrieves an object's parents."
  (gethash :parents obj))

(defun (setf parents) (val obj)
  (prog1 (setf (gethash :parents obj) val)
    (make-precedence obj)))

(defun make-precedence (obj)
  (setf (gethash :preclist obj) (precedence obj))
  (dolist (x *objs*)
    (if (member obj (gethash :preclist x))
	(setf (gethash :preclist x) (precedence x)))))

(defun obj (&rest parents)
  (let ((obj (make-hash-table)))
    (push obj *objs*)
    (setf (parents obj) parents)
    obj))

(defun rget(prop obj)
  (dolist (c (gethash :preclist obj))
    (multiple-value-bind (val in) (gethash prop c)
      (if in
	  (return (values val in))))))



(defmacro defprop (name &optional meth?)
  `(progn
     (defun ,name (obj &rest args)
       ,(if meth?
	    `(run-methods obj ',name args)
	    `(rget ',name obj)))
     (defun (setf ,name) (val obj)
       (setf (gethash ',name obj) val))))

(defun run-methods (obj name args)
  (let ((meth (rget name obj)))
    (if meth
	(apply meth obj args)
	(error "No ~A method for ~A." name obj))))


(defmacro defmeth (name obj parms &rest body)
  (let ((gobj (gensym)))
    `(let ((,gobj ,obj))
       (setf (gethash ',name ,gobj)
	     (labels ((next () (get-next ,gobj ',name)))
	       #'(lambda ,parms ,@body))))))

(defun get-next (obj name)
  (some #'(lambda (x) (gethash name x))
	(cdr (gethash :preclist obj))))



;; instance
(defun inst (parent)
  (let ((obj (make-hash-table)))
    (setf (gethash :parents obj) parent)
    obj))

(defun rget (prop obj)
  (let ((prec (gethash :preclist obj)))
    (if prec
	(dolist (c prec)
	  (multiple-value-bind (val in) (gethash prop c)
	    (if in (return (values val in)))))
	(multiple-value-bind (val in) (gethash prop obj)
	  (if in
	      (values val in)
	      (rget prop (gethash :parents obj)))))))

(defun get-next (obj name)
  (let ((prec (gethash :preclist obj)))
    (if prec
	(some #'(lambda (x) (gethash name x))
	      (cdr prec))
	(get-next (gethash obj :parents) name))))



;; new implementation

(defmacro parents (v) `(svref ,v 0))
(defmacro layout (v) `(the simple-vector (svref ,v 1)))
(defmacro preclist (v) `(svref ,v 2))

(defmacro class (&optional parents &rest props)
  `(class-fn (list ,@parents) ',props))

(defun class-fn (parents props)
  (let* ((all (union (inherit-props parents) props))
	 (obj (make-array (+ (length all) 3)
			  :initial-element :nil)))
    (setf (parents obj) parents
	  (layout obj) (coerce all 'simple-vector)
	  (preclist obj) (precedence obj))
    obj))

(defun inherit-props (classes)
  (delete-duplicates
   (mapcan #'(lambda (c)
	       (nconc (coerce (layout c) 'list)
		     (inherit-props (parents c))))
	   classes)))

(defun precedence (obj)
  (labels ((traverse (x)
	     (cons x
		   (mapcan #'traverse (parents x)))))
    (delete-duplicates (traverse obj))))

(defun inst (parent)
  (let ((obj (copy-seq parent)))
    (setf (parents obj) parent
	  (preclist obj) nil)
    (fill obj :nill :start 3)
    obj))


(declaim (inline lookup (setf lookup)))

(defun rget (prop obj next?)
  (let ((prec (preclist obj)))
    ;; class
    (if prec
	(dolist (c (if next? (cdr prec) prec) :nil)
	  (let ((val (lookup prop c)))
	    (unless (eq val :nil) (return val))))
	;; instance
	(let ((val (lookup prop obj)))
	  (if (eq val :nil)
	      (rget prop (parents obj) nil)
	      val)))))

(defun lookup (prop obj)
  (let ((off (position prop (layout obj) :test #'eq)))
    (if off (svref obj (+ off 3)) :nil)))

(defun (setf lookup) (val prop obj)
  (let ((off (position prop (layout obj) :test #'eq)))
    (if off
	(setf (svref obj (+ off 3)) val)
	(error "Can't set ~A of ~A." val obj))))


(declaim (inline run-methods))

(defmacro defprop (name &optional meth?)
  `(progn
     (defun ,name (obj &rest args)
       ,(if meth?
	    `(run-methods obj ',name args)
	    `(rget ',name obj nil)))
     (defun (setf ,name) (val obj)
       (setf (lookup ',name obj) val))))

(defun run-methods (obj name args)
  (let ((meth (rget name obj nil)))
    (if (not (eq meth :nil))
	(apply meth obj args)
	(error "No ~A method for ~A." name obj))))

(defmacro defmeth (name obj parms &rest body)
  (let ((gobj (gensym)))
    `(let ((,gobj ,obj))
       (defprop ,name t)
       (setf (lookup ',name ,gobj)
	     (labels ((next () (rget ,gobj ',name t)))
	       #'(lambda ,parms ,@body))))))
