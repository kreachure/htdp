# How to Design Functions

This is the first part of the HtDP. Follow this recipe:
1. Signature, purpose, stub
2. [Examples as check-expect](#examples)
3. Template and constants
4. Code function body
5. Test & debug until correct

Let's see an example: we need to design a function determining which image of two given is larger. 
By "larger" we mean both width and height are larger.

## Signature, purpose stub
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
