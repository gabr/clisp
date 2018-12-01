;;;; https://www.reddit.com/r/Common_Lisp/comments/4oe9me/is_it_possible_to_connect_to_a_repl/

;;; Swank was definitely the way to go,
;;; I used it just in a bare gnome terminal by doing something like:
(ql:quickload :swank-client)

;; Starting a swank server
(defun start-server ()
    (format t "Starting server")
    (swank-loader:init)
    (swank:create-server :port 4005 :dont-close t))

;; Try swank-client and check for server
(defvar *myswank* (swank-client:slime-connect "127.0.0.1" 4005))
(if (null *myswank*)
    (start-server)
    (format t "Connected to ~a~%" *myswank*))

;; Then just calling the server to eval like so:
(swank-client:slime-eval '(defun test () "boop") *myswank*)
;TEST
(swank-client:slime-eval '(test) *myswank*)
;"boop"

