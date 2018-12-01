; Given two integers a and b, which can be positive or negative,
; find the sum of all the numbers between including them too and return it.
; If the two numbers are equal return a or b.
;
; Note: a and b are not ordered!
;
; Examples:
;
;     GetSum(1, 0) == 1   // 1 + 0 = 1
;     GetSum(1, 2) == 3   // 1 + 2 = 3
;     GetSum(0, 1) == 1   // 0 + 1 = 1
;     GetSum(1, 1) == 1   // 1 Since both are same
;     GetSum(-1, 0) == -1 // -1 + 0 = -1
;     GetSum(-1, 2) == 2  // -1 + 0 + 1 + 2 = 2
;

(defun get-sum (a b)
  (if (= a b)
    a
    (progn
      (setq start (if (< a b) a b))
      (setq end   (if (< a b) b a))
      (setq start (- start 1))
      (setq sum 0)
      (loop
        (when (>= start end) (return sum))
        (setq sum (+ sum end))
        (setq end (- end 1))))))

(print (get-sum 1 0))  ; 1   // 1 + 0 = 1
(print (get-sum 1 0))  ; 1   // 1 + 0 = 1
(print (get-sum 1 2))  ; 3   // 1 + 2 = 3
(print (get-sum 0 1))  ; 1   // 0 + 1 = 1
(print (get-sum 1 1))  ; 1   // 1 Since both are same
(print (get-sum -1 0)) ; -1 // -1 + 0 = -1
(print (get-sum -1 2)) ; 2  // -1 + 0 + 1 + 2 = 2

