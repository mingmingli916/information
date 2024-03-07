(defstruct buf
  vec
  (start -1)
  (used -1)
  (new -1)
  (end -1))

(defun bref (buf n)
  "Takes a buffer and an index, and
returns the element stored in that index."
  (svref (buf-vec buf)			; vec in buf
	 (mod n (length (buf-vec buf)))))

(defun (setf bref) (val buf n)
  "Define setter."
  (setf (svref (buf-vec buf)
	       (mod n (length (buf-vec buf))))
	val))

(defun new-buf (len)
  "Yields a new buffer able to hold
up to `n` ojbects."
  (make-buf :vec (make-array len)))

(defun buf-insert (x b)
  "Insert a new value into a buffer by
incrementing the `end` and puts the new
value at that position."
  ;; incf: like 1+, but in place
  (setf (bref b (incf (buf-end b)))
	x))

(defun buf-pop (b)
  "Returns the first value in a buffer,
then increments its `start`."
  ;; prog1 is similar to progn, but it
  ;; returns the value of its first form.
  ;; All the argument forms are executed
  ;; sequentially; the value of the first
  ;; form is saved while all the others
  ;; are executed and is then returned.
  (prog1
      (bref b (incf (buf-start b)))
    (setf (buf-used b) (buf-start b)
	  (buf-new b) (buf-end b))))

(defun buf-next (b)
  "Reads a value from a buffer without
popping it."
  (when (< (buf-used b) (buf-new b))
    (bref b (incf (buf-used b)))))

(defun buf-reset (b)
  "Resets the `used` and `new` indices
to their intial values, `start` and
`end`."
  (setf (buf-used b) (buf-start b)
	(buf-new b) (buf-end b)))

(defun buf-clear (b)
  "Empties a buffer by resetting all
the indices to -1."
  (setf (buf-start b) -1
	(buf-used b) -1
	(buf-new b) -1
	(buf-end b) -1))

(defun buf-flush (b str)
  "Flushes a buffer by writting all the
live elements to a stream."
  (do ((i (1+ (buf-used b)) (1+ i)))
      ((> i (buf-end b)))
    (princ (bref b i) str)))


(defun file-subst (old new file1 file2)
  (with-open-file (in file1 :direction :input)
    (with-open-file (out file2 :direction :output
			       :if-exists :supersede)
      (stream-subst old new in out))))

(defun stream-subst (old new in out)
  (let* ((pos 0)			; points to the position
					; of the character we are
					; trying to match in the
					; sought-for string.
	 (len (length old))
	 (buf (new-buf len))
	 (from-buf nil))
    ;; (variable intial update)
    (do ((c (read-char in nil :eof)
	    (or (setf from-buf (buf-next buf))
		(read-char in nil :eof))))
	((eql c :eof))			; termination
      (cond ((char= c (char old pos))
	     (incf pos)
	     ;; When we have a complete match, we write
	     ;; the replacement string to the output stream,
	     ;; also clearing the buffer.
	     (cond ((= pos len)
		    (princ new out)
		    (setf pos 0)
		    (buf-clear buf))
		   ;; When a match begins, the characters
		   ;; involved are queued in the buffer buf.
		   ((not from-buf)
		    (buf-insert c buf))))
	    ;; Until the input character matches
	    ;; the first element of the sought-for
	    ;; string, it is written immediately
	    ;; to the output stream.
	    ((zerop pos)
	     (princ c out)
	     (when from-buf
	       (buf-pop buf)
	       (buf-reset buf)))
	    (t
	     ;; If the match fails before pos, we can
	     ;; pop the first character in the buffer
	     ;; and write it to the output stream, after
	     ;; which we reset the buffer and start
	     ;; over with pos equal to zero.
	     (unless from-buf
	       (buf-insert c buf))
	     (princ (buf-pop buf) out)
	     (buf-reset buf)
	     (setf pos 0))))
    (buf-flush buf out)))
