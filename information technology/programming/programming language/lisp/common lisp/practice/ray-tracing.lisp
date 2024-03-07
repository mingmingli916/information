(defun sq (x)
  "Returns the square of its argument."
  (* x x))

(defun mag (x y z)
  "Returns the length of a vector given
its x y and z components."
  (sqrt (+ (sq x) (sq y) (sq z))))

(defun unit-vector (x y z)
  "Returns three values representing the
components of a unit vector with the same
direction as the vector whose components
are x, y and z."
  (let ((d (mag x y z)))
    (values (/ x d) (/ y d) (/ z d))))

(defstruct (point
	    ;; The access functions for the
	    ;; fields will have the same names
	    ;; as the fields: x instead of
	    ;; point-x for example.
	    (:conc-name nil))
  x y z)

(defun distance (p1 p2)
  "Returns two distance of two points."
  (mag (- (x p1) (x p2))		;(x p1) return x component of point p1
       (- (y p1) (y p2))
       (- (z p1) (z p2))))


(defun minroot (a b c)
  "Returns the minimal root for which
ax^2 + bx + c = 0."
  (if (zerop a)
      (/ (- c) b)
      (let ((disc (- (sq b) (* 4 a c))))
	(unless (minusp disc)
	  (let ((discrt (sqrt disc)))
	    (min (/ (+ (- b) discrt) (* 2 a))
		 (/ (- (- b) discrt) (* 2 a))))))))



(defstruct surface
  "It will be included in the structure defined
to represent sepecfic kinds of objects, like spheres.
It contains only a single field: a color ranging
from 0 (black) to 1 (white)."
  color)

(defparameter *world* nil)
(defconstant eye (make-point :x 0 :y 0 :z 200))

(defun tracer (pathname &optional (res 1)) ;res: resolution
  "Preduces a image plane. Each pixel represents
the amount of light that passes through the image
plane at that point on the way to the eye."
  (with-open-file (p pathname :direction :output)
    (format p "P2 ~A ~A 255" (* res 100) (* res 100))
    (let ((inc (/ res)))
      (do ((y -50 (+ y inc)))
	  ((< (- 50 y) inc))
	(do ((x -50 (+ x inc)))
	    ((< (- 50 x) inc))
	  (print (color-at x y) p))))))

(defun color-at (x y)
  "Returns the color at point (x, y)."
  (multiple-value-bind (xr yr zr)
      (unit-vector (- x (x eye))
		   (- y (y eye))
		   (- 0 (z eye)))
    (round (* (sendray eye xr yr zr) 255))))


(defun sendray (pt xr yr zr)
  "Return an intensity value between 0 and 1."
  (multiple-value-bind (s int) (first-hit pt xr yr zr)
    (if s
	(* (lambert s int xr yr zr) (surface-color s))
	0)))

(defun first-hit (pt xr yr zr)
  "Returns the surface (if any) that the ray
hits first."
  (let (surface hit dist)
    (dolist (s *world*)
      (let ((h (intersect s pt xr yr zr)))
	(when h
	  (let ((d (distance h pt)))
	    (when (or (null dist) (< d dist))
	      (setf surface s hit h dist d))))))
    (values surface hit)))

(defun lambert (s int xr yr zr)		; Lambert's law
  (multiple-value-bind (xn yn zn) (normal s int)
    (max 0 (+ (* xr xn) (* yr yn) (* zr zn)))))



(defstruct (sphere (:include surface))
  radius
  center)

(defun defsphere (x y z r c)
  "Add a new sphere to the world"
  (let ((s (make-sphere
	    :radius r
	    :center (make-point :x x :y y :z z)
	    :color c)))
    (push s *world*)
    s))

(defun intersect (s pt xr yr zr)
  "It considers the type of surface involved and
calls the corresponding intersect function."
  ;; This form is for the extendibilty.
  (funcall (typecase s (sphere #'sphere-intersect))
	   s pt xr yr zr))

(defun sphere-intersect (s pt xr yr zr)
  "Returns the intersection of a ray with a sphere."
  (let* ((c (sphere-center s))
	 (n (minroot (+ (sq xr) (sq yr) (sq zr))
		     (* 2 (+ (* (- (x pt) (x c)) xr)
			     (* (- (y pt) (y c)) yr)
			     (* (- (z pt) (z c)) zr)))
		     (+ (sq (- (x pt) (x c)))
			(sq (- (y pt) (y c)))
			(sq (- (z pt) (z c)))
			(- (sq (sphere-radius s)))))))
    (if n
	(make-point :x (+ (x pt) (* n xr))
		    :y (+ (y pt) (* n yr))
		    :z (+ (z pt) (* n zr))))))

(defun normal (s pt)
  (funcall (typecase s (sphere #'sphere-normal))
	   s pt))

(defun sphere-normal (s pt)
  (let ((c (sphere-center s)))
    (unit-vector (- (x c) (x pt))
		 (- (y c) (y pt))
		 (- (z c) (z pt)))))

(defun ray-test (&key (filename "spheres.pgm") (res 1))
  (setf *world* nil)
  (defsphere 0 -300 -1200 200 .8)
  (defsphere -80 -150 -1200 200 .7)
  (defsphere 70 -100 -1200 200 .9)
  (do ((x -3 (1+ x)))
      ((> x 3))
    (do ((z 1 (1+ z)))
	((> z 8))
      (defsphere (* x 200) 300 (* z -400) 40 .75)))
  (tracer (make-pathname :name filename) res))