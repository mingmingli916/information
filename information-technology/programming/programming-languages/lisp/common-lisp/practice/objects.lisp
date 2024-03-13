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
