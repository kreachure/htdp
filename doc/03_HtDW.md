# How to Design Worlds
See also [HtDD](HtDD.md) and [HtDF](HtDF.md).

## Recipe
1. Domain analysis (use piece of paper)
    1. [Sketch program scenarios](#sketch-program-scenarios)
    2. Identify constant information
    3. Identify changing information
    4. Identify big-bang options
2. Build the actual program
    1. [Constants](#constants) based on 1.2
    2. [Data definitions](#data-definitions) using [HtDD](HtDD.md)
    3. [Functions](#functions-using-htdf) using [HtDF](HtDF.md)
        1. [Main](#main-first) first (based on 1.3, 1.4 and 2.2 above)
        2. [Wishlist entries](#wishlist-then) for big-bang options
    3. Work through wishlist until done

## Example
### Sketch program scenarios
![image](https://user-images.githubusercontent.com/85282521/121912300-260abd00-cd39-11eb-9cfa-4291c92c890b.png)

### Build actual program:
#### Constants
![image](https://user-images.githubusercontent.com/85282521/121913344-fc9e6100-cd39-11eb-93a1-d0a080ab4de6.png)

#### Data definitions
```racket
;; =================
;; Data definitions:

;; Cat is one of:
;; - atomic non-distinct: Number[0;WIDTH]
;; - atomic distinct: Number[>WIDTH]
;; interp. Cat is X coordinate of the cat
(define C0 0)   ;left edge
(define C1 (/ WIDTH 2))  ;somewhere in the middle
(define C2 WIDTH) ;right edge of the screen

#;
(define (fn-for-cat c)
  (cond [(and (<= 0 c) (<= c WIDTH)) (... c)]
        [else (...)]
  ))
;; Template rules used:
;; One-of: 2
;; atomic non-distinct: Number[0; WIDTH]
;; atomic distinct: Number[>WIDTH]
```
#### Functions using HtDF
##### Main first
```racket
;; =================
;; Functions:

;; Cat -> Cat
;; start the world with cat at the left edge: (main 0)
;; 
(define (main c)
  (big-bang c                ; Cat
    (on-tick   advance-cat)  ; Cat -> Cat
    (to-draw   render)       ; Cat -> Image
))
```
##### Wishlist then
```racket
;; Cat -> Cat
;; produce the next cat by advancing its X coordinate by SPEED
;; 
(define (advance-cat c)
  (cond [(and (<= 0 c) (< c WIDTH)) (+ c SPEED)]
        [else 0]
  ))

(check-expect (advance-cat 0) SPEED)
(check-expect (advance-cat WIDTH) 0)

;; Cat -> Image
;; render cat by placing its image at an appropriate coordinates in MTS
;; 
(define (render c)
  (place-image CAT-IMG c CTR-Y MTS)
  )

(check-expect (render 0) (place-image CAT-IMG 0 CTR-Y MTS))
```
