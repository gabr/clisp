; Dokumentacja: http://clhs.lisp.se
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

