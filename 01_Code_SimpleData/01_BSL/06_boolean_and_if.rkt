;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 06_boolean_and_if) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Booleans and comparison
(> 1 2)
(define FOO1 "foo")
(define FOO2 "foo")
(string>? "foo" "bar")
(string=? FOO1 FOO2)

; ifs like IIF in excel
(if (string=? FOO1 FOO2) ; question
    "Yes, same" ; true expression
    "No, not same") ; false expression

(and true false)