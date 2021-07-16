# Self-Reference
## Goals:
* Be able to use list mechanisms to construct and destruct lists
* Be able to identify problem domain information of arbitrary size that should be represented using lists and lists of structures
* Be able to use HtDD, HtDF and Design Driven Templates recipes with such data
* Be able to explain what makes a self-referential data definition [well-formed](#well-formed-self-referential-data) and identify whether a particular self-referential data definition is well-formed
* Be able to design functions that consume and produce lists and list structures
* Be able to predict and identify correspondence between self-references in a data definition and natural recursions in functions that operate on the data

## List of Strings:
```racket
;; =============
;; Data Definitions
;; ==================
;; Data Definitions
;; ListOfString is one of: 2 cases
;; - empty
;; - (cons ListOfString empty)
(define LOS1 empty)
(define LOS2 (cons "SDEL" empty))
(define LOS3 (cons "DCS" (cons "SDEL" empty)))
(define LOS4 (cons "UBC" (cons "DCS" (cons "SDEL" empty))))
(define LOS5 (cons "McGill" (cons "UBC" empty)))

;; Template
#;
(define (fn-for-los los)
  (cond [(empty? los) ...]
        [else (...
               (first los)    ; String
               (rest los))])) ; ListOfStrings

;; Template rules used:
;; One of: 2 cases
;; -- atomic distinct: empty
;; -- compound data

;; ================
;; Functions

;; LOS -> Boolean
;; Given ListOfStrings returns true if it contains "UBC". False otherwise.
(check-expect (contains-ubc? LOS1) false)
(check-expect (contains-ubc? LOS2) false)
(check-expect (contains-ubc? LOS3) false)
(check-expect (contains-ubc? LOS4) true)
(check-expect (contains-ubc? LOS5) true)
; (define (contains-ubc? los) true) ; stub
(define (contains-ubc? los)
  (if (empty? los)
      false
      (if (string=? "UBC" (first los))
          true
          (contains-ubc? (rest los)))))

```
## Well-formed self-referential data
Well-formed self reference should have:
* at least one base case
* at least one self reference case
```racket
;; ListOfString is one of: 2 cases
;; - empty                             <-- base case
;; - (cons ListOfString empty)         <-- self reference case
```
