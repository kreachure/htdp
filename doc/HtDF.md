# How to Design Functions

This is the first part of the HtDP. 
See [HtDD](HtDD.md) and [HtDF](HtDF.md) also!
Follow this recipe:
1. [Signature, purpose, stub](#signature-purpose-stub)
2. [Examples as check-expect](#examples)
3. [Template and constants](#template-and-constants)
4. [Code function body](#code-function-body)
5. [Test & debug until correct](#test-and-debug-until-correct)

Let's see an example: we need to design a function determining which image of two given is larger. 
By "larger" we mean both width and height are larger.

## Signature, purpose, stub
Signature:
```
;; Image Image -> Boolean
```

Purpose:
```
;; Given two images determine which is larger.
;; If both width and height of the first Image are larger than the ones of the second Image then return true. 
;; Otherwise return false.
```

Stub is a hollow implementation of the function to fail at test time:
```Racket
(define (larger-img? img1 img2) false) ; stub
```
Comment out this code sample later with a couple of semicolons.

## Examples
Write examples with `check-expect`s using some constants (hence "examples & constants" in title).
A good example should contain a set of tests to check all the aspects. 
Thus in our case, we have nine possible combinations of width & height:

| height\width | smaller | same | larger |
---------------|---------|------|---------
| smaller      |    F    |  F   |   F    |
| same         |    F    |  F   |   F    |
| larger       |    F    |  F   |   T    |

```racket
(define (rect width height) ; an auxiliary function to avoid repetition of "solid" "black"
  (rectangle width height "solid" "black"))

(check-expect (larger-img? (rect 10 10) (rect 20 20)) false) ; smaller-smaller
(check-expect (larger-img? (rect 10 10) (rect 20 10)) false) ; smaller-same
(check-expect (larger-img? (rect 10 20) (rect 20 10)) false) ; smaller-larger
(check-expect (larger-img? (rect 10 10) (rect 10 20)) false) ; same-smaller
(check-expect (larger-img? (rect 10 10) (rect 10 10)) false) ; same-same
(check-expect (larger-img? (rect 10 10) (rect 10 20)) false) ; same-larger
(check-expect (larger-img? (rect 20 10) (rect 10 20)) false) ; larger-smaller
(check-expect (larger-img? (rect 20 10) (rect 10 10)) false) ; larger-same
(check-expect (larger-img? (rect 20 20) (rect 10 10)) true) ; larger-larger
```
## Template and constants
Template is another hollow function definition showing how to write this function.
Actual use of it will come in HtDD.
```racket
(define (larger-img? img1 img2)
  (... img1 img2))
```

## Code function body
When all the above is done, comment out the template and write the real function:

```racket
(require 2htdp/image)

(define (larger-img? img1 img2)
  (and
    (> (image-width img1) (image-width img2))
    (> (image-height img1) (image-height img2)))
```

## Test and debug until correct
Well.. self explanatory. 
Let's see the whole code:

![image](https://user-images.githubusercontent.com/85282521/120987295-20840480-c786-11eb-84d2-79ce8abf508d.png)
```racket
(require 2htdp/image)
;; Image Image -> Boolean
;; Given two images determine which is larger.
;; If both width and height of the first Image are larger than the ones of the second Image then return true. 
;; Otherwise return false.
;; (define (larger-img? img1 img2) false) ; stub
;; Examples:
(define (rect width height) ; an auxiliary function to avoid repetition of "solid" "black"
  (rectangle width height "solid" "black"))

(check-expect (larger-img? (rect 10 10) (rect 20 20)) false) ; smaller-smaller
(check-expect (larger-img? (rect 10 10) (rect 20 10)) false) ; smaller-same
(check-expect (larger-img? (rect 10 20) (rect 20 10)) false) ; smaller-larger
(check-expect (larger-img? (rect 10 10) (rect 10 20)) false) ; same-smaller
(check-expect (larger-img? (rect 10 10) (rect 10 10)) false) ; same-same
(check-expect (larger-img? (rect 10 10) (rect 10 20)) false) ; same-larger
(check-expect (larger-img? (rect 20 10) (rect 10 20)) false) ; larger-smaller
(check-expect (larger-img? (rect 20 10) (rect 10 10)) false) ; larger-same
(check-expect (larger-img? (rect 20 20) (rect 10 10)) true) ; larger-larger
#;
(define (larger-img? img1 img2) ; template
  (... img1 img2))

;; Real definition
(define (larger-img? img1 img2)
  (and
    (> (image-width img1) (image-width img2))
    (> (image-height img1) (image-height img2)))
```
