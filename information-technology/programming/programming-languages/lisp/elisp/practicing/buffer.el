(defun beginning-of-buffer-mine (&optional arg)
  "Move point to the beginning of the buffer;
leave mark at previous position.
with \\[universal-argument] prefix,
do not set mark at previous position.
With numeric arg N,
put point N/10 of the way from the beginning.

If the buffer is narrowed,
this command uses the beginning and size
of the accessible part of the buffer.



Don't use this command in Lisp programs!
\(goto-char (point-min)) is faster
and avoids clobbering the mark."
  (interactive "P")
  (or (consp arg)
      (and transient-mark-mode mark-active)
      (push-mark))

  (let ((size (- (point-max) (point-min))))
    (goto-char (if (and arg (not (consp arg)))
		   (+ (point-min)
		      (if (> size 10000)
			  (* (prefix-numeric-value arg)
			     (/ size 10))
			(/ (+ 10 (* size (prefix-numeric-value arg)))
			   10)))
		 (point-min))))
  (if (and arg (not (consp arg))) (forward-line 1)))
