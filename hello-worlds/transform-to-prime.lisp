; Given a list of n integers, find minimum number to be inserted in a list,
; so that sum of all elements of list should equal the closest prime number.

(defun get-closest-primes-for (value)
  (defun find-prime (start increment)
    (defun is-prime (value &optional (divider 2))
      (cond
        ((<= value divider) t)
        ((not (= (mod value divider) 0)) nil)
        ((is-prime value (+ divider 1)))))
    (cond
      ((< start 2) nil)
      ((<= start 3) start)
      ((loop
        (when (is-prime start) (return start))
        (setq start (+ start increment))))))
  (cons
    (find-prime value -1)
    (find-prime value 1)))


(defun minimum-number (numbers)
  (setq sum (apply #'+ numbers))
  (setq closest (get-closest-primes-for sum))
  0)


(defun test (numbers expected-result)
  (setq result (minimum-number numbers))
  (if (= result expected-result)
    (format t "OK   ~S -> ~S = ~S~%"
            numbers result expected-result)
    (format t "FAIL ~S -> ~S != ~S~%"
            numbers result expected-result)))

(test (list 3 1 2) 1)
(test (list 5 2) 0)
(test (list 1 1 1) 0)
(test (list 2 12 8 4 6) 5)
(test (list 50 39 49 6 17 28) 2)

