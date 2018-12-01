(defun hello-to-name (name)
  (format t "Hello ~a!~%" name))

(format t "What's your name: ")
(defvar *name* (read))

(setq *print-case* :capitalize)
(hello-to-name *name*)

