;; Funkcje lokalne, odpowiednik let od zmiennych
(flet ((f (x) (+ x 10))
       (g (x) (- x 3)))
  (g (f 2)))

;; labels pozwala na u¿ycie zadeklarowanych funkcji wewnatrz funkcji
;; odpowiednik let* od zmiennych
(labels ((f (x) (+ x 10))
         (g (x) (- (f x) 3)))
  (g 2))

