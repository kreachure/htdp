;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1_traffic_light) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Data definition
; TLColor is one of:
; - 0
; - 1
; - 2
; Interpretation: TLColor represents a traffic light: 0 - red, 1 - yellow, 2 - green
#;
(define (fn-tl-color tlc)
  (... tlc))

;; Function definition
;; TLColor -> TLColor
;; given a current traffic light, produces the next traffic light
;; (define (next-color tlc) 0) ; stub

(check-expect (next-color 0) 2)
(check-expect (next-color 1) 0)
(check-expect (next-color 2) 1)

;; template
#;
(define (next-color tlc)
  (... tlc))
    
(define (next-color tlc)
  (cond
        [(= tlc 0) 2]
        [(= tlc 1) 0]
        [(= tlc 2) 1]))