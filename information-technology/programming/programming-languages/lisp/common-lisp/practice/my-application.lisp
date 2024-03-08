(defpackage "MY-APPLICATION"
  (:use "COMMON-LISP")
  (:nicknames "APP")
  (:export "NOISE" "NOISE2"))

(in-package my-application)



(defun noise (animal)
  (case animal
    (:dog :woof)
    (:cat :meow)
    (:pig :oink)))

(defun noise2 (animal)
  (case animal
    ('dog 'woof)
    ('cat 'meow)
    ('pig 'oink)))


