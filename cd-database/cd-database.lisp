; http://www.gigamonkeys.com/book/practical-a-simple-database.html

; database with all cd records
(defvar *db* nil)

(defun save-db (file-name)
  (with-open-file (out file-name
                   :direction :output
                   :if-exists :supersede)
    (with-standard-io-syntax
      (print *db* out))))

(defun load-db (file-name)
  (with-open-file (in file-name)
    (with-standard-io-syntax
      (setq *db* (read in)))))

(defun clear-db ()
  (setq *db* nil))

(defun make-comparison-expr (field value)
  `(equal (getf cd ,field) ,value))

(defun make-comparison-list (fields)
  (loop while fields
    collecting (make-comparison-expr (pop fields) (pop fields))))

(defmacro where (&rest clauses)
  `#'(lambda (cd) (and ,@(make-comparison-list clauses))))

(defun select (selector-fn)
  (remove-if-not selector-fn *db*))

(defun update (selector-fn &key title artist rating (ripped nil ripped-p))
  (setf *db*
    (mapcar
      #'(lambda (row)
          (when (funcall selector-fn row)
            (if title    (setf (getf row :title)  title))
            (if artist   (setf (getf row :artist) artist))
            (if rating   (setf (getf row :rating) rating))
            (if ripped-p (setf (getf row :ripped) ripped)))
          row) *db*)))

(defun delete-cds (selector-fn)
  (setf *db* (remove-if selector-fn *db*)))

(defun make-cd (title artist rating ripped)
  (list :title title :artist artist :rating rating :ripped ripped))

(defun add-record (cd) (push cd *db*))

(defun setup-default-db ()
  (clear-db)
  (add-record (make-cd "Nothing else matters" "Metailica" 10 t))
  (add-record (make-cd "Roses" "Kathy Mattea" 7 t))
  (add-record (make-cd "Fly" "Dixie Chicks" 8 t))
  (add-record (make-cd "Home" "Dixie Chicks" 9 t)))

(defun print-db ()
  (dolist (cd *db*)
    (format t "~{~a:~10t~a~%~}~%" cd)))

(defun prompt-read (&optional (prompt ""))
  ; to też działa: (format t "~a: " prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun prompt-for-cd ()
  (make-cd
    (prompt-read "Ttitle")
    (prompt-read "Artist")
    (or (parse-integer (prompt-read "Rating") :junk-allowed t) 0)
    (y-or-n-p  "Ripped [y/n]")))

(defun add-cds ()
  (loop
    (add-record (prompt-for-cd))
    (if (not (y-or-n-p "Another? [y/n]: ")) (return))))

