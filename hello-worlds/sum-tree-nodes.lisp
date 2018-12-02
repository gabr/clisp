(defvar *tree*)
(setf *tree* '((1 2) ((3 6) 4))) ; sum: 16

(defun sum-binary-tree (tree)
  (if (listp tree)
    (+ (sum-binary-tree (car tree))
       (sum-binary-tree (cadr tree)))
    tree))

(print (sum-binary-tree *tree*))

