;; In this program, we're going to represent information in a familiar form:
;; a list consisting of a predicate followed by zero or more arguments. To
;; represent the fact that Donald is the parent of Nancy, we might say:
;; (parent donald nancy)

;; As well as facts, our program is going to represent rules that tell what
;; can be inferred from the facts we already have. We will represent such
;; rules as
;; (<- head body)
;; where head is the then-part and body is the if-part. Within the head and
;; body we will represent variables as symbols beginning with question marks.
;; So this rule
;; (<- (child ?x ?y) (parent ?y ?x))
;; says that if y is the parent of x, then x is the child of y; or more
;; precisely, that we can prove any fact of the form (child x y) by proving (parent y x).


;; It will be possible for the body (if-part) of a rule to be a complex
;; expression, containing the logical operators and, or, and not. So if we
;; want to represent the rule that if x is the parent of y, and x is male,
;; then x is the father of y, we would write:
;; (<- (father ?x ?y) (and (parent ?x ?y) (male ?x)))


;; Rules may depend on facts implied by other rules. For example, the first
;; rule we wrote was for proving facts of the form (child x y). If we defined
;; a rule
;; (<- (daughter ?x ?y) (and (child ?x ?y) (female ?x)))
;; then using it to prove (daughter x y) might cause the program to use the
;; first rule to prove (child x y).

;; The proof of an expression can continue back through any number of rules,
;; so long as it eventually ends up on the solid ground of known facts. This
;; process is sometimes called backward chaining. The backward comes from the
;; fact that this kind of inference first considers the then-part, to see
;; if the rule will be useful, before going on to prove the if-part. The
;; chaining comes from the way that rules can depend on other rules, forming
;; a chain (though in fact it's more like a tree) that leads from what we want
;; to prove back to what we already know.


;; In order to write our backward-chaining program, we are going to need a
;; function to do pattern-matching: a function that can compare two lists,
;; possibly containing variables, to see if there is some way of assigning
;; values to the variables which makes the two equal. For example, if ?x 
;; and ?y are variables, then the two lists 
;; (p ?x ?y c ?x)
;; (p  a  b c  a)
;; match when ?x = a and ?y = b, and the lists
;; (p ?x b ?y a)
;; (p ?y b c  a)
;; match when ?x = ?y = c.


(defun match (x y &optional binds)
  (cond
    ((eql x y) (values binds t))
    ((assoc x binds) (match (binding x binds) y binds))
    ((assoc y binds) (match x (binding y binds) binds))
    ((var? x) (values (cons (cons x y) binds) t))
    ((var? y) (values (cons (cons y x) binds) t))
    (t
     (when (and (consp x) (consp y))
       (multiple-value-bind (b2 yes)
	   (match (car x) (car y) binds)
	 (and yes (match (cdr x) (cdr y) b2)))))))

(defun var? (x)
  "Return true if x is a variable.
For example, ?x is a variable but a is not a variable."
  (and (symbolp x)
       (eql (char (symbol-name x) 0) #\?)))

(defun binding (x binds)
  (let ((b (assoc x binds)))
    (if b
	(or (binding (cdr b) binds)
	    (cdr b)))))


;; In English, the match algorithm works as follows:
;; 1. If x and y are eql they match; otherwise,
;; 2. If x is avariable that has a binding, they match if it matches y;otherwise,
;; 3. If y is avariable that has a binding, they match if it matches x;otherwise,
;; 4. If x is a variable (without a binding), they match and thereby establish a binding for it; otherwise,
;; 5. If y is a variable (without a binding), they match and thereby establish a binding for it; otherwise,
;; 6. They match if they are both conses, and the cars match, and the cdrs match with the bindings generated thereby.


;; Here is an example illustrating, in order, each of the six cases:
;; > (match '(p ?v b ?x d (?z ?z))
;;          '(p a ?w c ?y (e e))
;;          '((?v . a) (?w . b)))
;; ((?Z . E) (?Y . D) (?X . C) (?V . A) (?W . B))
;; T



;; `defvar` and `defparameter` introduce global dynamic variables.
;; `defvar` optionally sets it to some value, unless it is already
;; defined. `defparameter` sets it always to the provided value.
(defvar *rules* (make-hash-table))


;; We will use the same macro, <-, to define both facts and rules.
;; A fact will be represented as a rule with a head but no body. 
(defmacro <- (con &optional ant)
  "Return the number of rules now stored under a given predicate."
  `(length (push (cons (cdr ',con) ',ant)
		 (gethash (car ',con) *rules*))))


(defun prove (expr &optional binds)
  (case (car expr)
    (and (prove-and (reverse (cdr expr)) binds))
    (or (prove-or (cdr expr) binds))
    (not (prove-not (cadr expr) binds))
    (t (prove-simple (car expr) (cdr expr) binds))))

(defun prove-simple (pred args binds)
  (mapcan #'(lambda (r)
	      (multiple-value-bind (b2 yes)
		  (match args (car r) binds)
		(when yes
		  (if (cdr r)
		      (prove (cdr r) b2)
		      (list b2)))))
	  (mapcar #'change-vars
		  (gethash pred *rules*))))

(defun change-vars (r)
  (sublis (mapcar #'(lambda (v)
		      (cons v (gensym "?")))
		  (vars-in r))
	  r))

(defun vars-in (expr)
  (if (atom expr)
      (if (var? expr) (list expr))
      (union (vars-in (car expr))
	     (vars-in (cdr expr)))))

(defun prove-and (clauses binds)
  (if (null clauses)
      (list binds)
      (mapcan #'(lambda (b)
		  (prove (car clauses) b))
	      (prove-and (cdr clauses) binds))))

(defun prove-or (clauses binds)
  (mapcan #'(lambda (c)
	      (prove c binds))
	  clauses))

(defun prove-not (clause binds)
  (unless (prove clause binds)
    (list binds)))


(defmacro with-answer (query &body body)
  (let ((binds (gensym)))
    `(dolist (,binds (prove ',query))
       (let ,(mapcar #'(lambda (v)
			 `(,v (binding ',v ,binds)))
		     (vars-in query))
	 ,@body))))




(<- (parent aichi mingming))
(<- (parent aichi liangliang))
(<- (male aichi))

(<- (father ?x ?y) (and (parent ?x ?y) (male ?x)))
(<- (= ?x ?x))
(<- (sibling ?x ?y) (and (parent ?z ?x)
			 (parent ?z ?y)
			 (not (= ?x ?y))))
