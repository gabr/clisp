;;; Practical Common Lisp: http://www.gigamonkeys.com/book/
;;; Dokumentacja: http://clhs.lisp.se
;;; CookBook: https://lispcookbook.github.io/cl-cookbook/
;;; Books: https://github.com/clojurians-org/lisp-ebook
;;; Functional Common Lisp: https://lisp-journey.gitlab.io/blog/functional-programming-in-common-lisp/
;;;     http://cl21.org/

; Wypisanie wszystkich pakietów ze wszystkimi zmiennymi i funkcjami:
(apropos "")
; Wypisanie dla konkretnego pakietu:
(apropos "" 'packagename)
; Wypisanie wszystkich pakietów:
(list-all-packages)
; Pokazanie z którego pakietu jest dany symbol
(symbol-package 'symbol-name)

; Wypisanie informacji o funkcji:
(describe #'function-name)
; Dekompilacja funkcji:
(disassemble #'function-name)

; Możesz sie poruszać po katalogach i wypisaywać je używając
(dir)
(cd) ; Wypisz aktualną ścieżkę
(dir "*.lisp")
(cd "directory")

; Ładowanie plików będąc w interpreterze
(load "file/path.lisp")
; Kompilacja pliku i załadowanie skompilowanej wersji
(load (compile-file "file/path.lisp"))

; Uzyj macroexpand-1 żeby zobaczyć do czego roziwnie się makro
; (przykład z kodu cd-database.lisp)
(macroexpand-1 '(where :title "Give Us a Break" :ripped t))

