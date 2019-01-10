;;;; https://www.codewars.com/kata/54bb6f887e5a80180900046b/train/csharp

;;; Longest Palindrome
;;; Find the length of the longest substring in
;;; the given string s that is the same in reverse.
;;;
;;; As an example, if the input was “I like racecars that go fast”,
;;; the substring (racecar) length would be 7.
;;;
;;; If the length of the input string is 0, the return value must be 0.

(defvar *test-cases*)
(setf *test-cases*
      '(("" 0)
        ("a" 1)
        ("aab" 2)
        ("baa" 2)
        ("abcde" 1)
        ("12 21glg" 5)
        ("zzbaabcd" 4)
        ("abc0cba1" 7)))

(defun solve (input)
  (if (= (length input) 0) (return-from solve 0))
  -1)

(defun test (input expected-result)
  (format t "~%'~a' -> ~a  ~a"
          input
          expected-result
          (let ((result (solve input)))
            (if (= result expected-result)
              "OK"
              (format nil "FAIL got: ~a" result)))))

(dolist (tc *test-cases*)
  (test (car tc) (cadr tc)))

