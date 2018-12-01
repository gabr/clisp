(format t "Test")
(print (list 12 3))
(format t "~%Multiline~%output~%")
(format t "test 1 ") ; comment
(format t "test 2 ")
(print 1)
(print 2)
(format t "~%Number: ~D~%List: ~S~%" 7 (list 1 2 3))

(setq f (format nil "Value is: ~S" 123))
(print f)
(format t "~%Test: ~S~%" f)
(format t f)

(print (let ((x 1)
             (y 2)
             (z 3))
         (+ x y z)))

(print (concatenate 'string f " hop hop"))
