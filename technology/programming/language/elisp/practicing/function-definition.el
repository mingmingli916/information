;; (defun multiply-by-seven (number)
;;   "Multiply NUMBER by seven."
;;   (* 7 number))

(defun multiply-by-seven (number)	; interactive version
  "Multiply NUMBER by seven."
  (interactive "p")			; prefix argument
  (message "The result is %d" (* 7 number)))



(multiply-by-seven 3)

(let ((first-name "Aike")
      (last-name "Acheson"))
  (message "My English name is %s %s." first-name last-name))



(defun doubled (number)
  "Double the NUMBER."
  (interactive "p")
  (message "The result is %d" (* number number)))

(doubled 4)				;"The result is 16"



(defun greater-than-fill-column (number)
  "Test if NUMBER is greater than fill-column."
  (if (> number fill-column)
      (message "%d is greater than fill-column." number)
    (message "%d is not greater than fill-column." number)))

(greater-than-fill-column 80)		;"80 is greater than fill-column."
(greater-than-fill-column 60)		;"60 is not greater than fill-column."
