# Helper functions
There is a few reasons to split a function into helpers:
* Function composition
* Operating on a list
* Domain knowledge shift

## Function composition
Here is an example:
```racket
;; ListOfImage -> Image
;; Given an arbitrary list of images, lays them out left-to-right in increasing order of the area (length * height)
(define (arrange-images loi)
  (layout-images (sort-images loi))) ; <-- function composition 
```
## Operating on a list
Here is a good example:
```racket
;; ListOfImage -> ListOfImage
;; Given a list of imgaes, sorts it by size (area) of images
(define (sort-images loi)
   (cond [(empty? loi) empty]
        [else
         (insert (first loi)               ; <-- operating on a list
              (sort-images (rest loi)))]))

;; Image ListOfImage -> ListOfImage
;; Insert image into a correct place of given list. The given list is sorted already
(define (insert img loi)
  (cond [(empty? loi) (cons img empty)]
        [else
         (if (image<? img (first loi))
             (cons img loi)
             (cons (first loi) (insert img (rest loi))))]))
```
## Knowledge domain shift
And here is knowledge domain shift:
```racket
;; Image ListOfImage -> ListOfImage
;; Insert image into a correct place of given list. The given list is sorted already
(define (insert img loi)
  (cond [(empty? loi) (cons img empty)]
        [else
         (if (image<? img (first loi))         ;  <-- knowledge domain shift
             (cons img loi)
             (cons (first loi) (insert img (rest loi))))]))
             
;; Image Image -> Boolean
;; Given two images, returns true if the first one is less (by area) than the second one
(define (image<? img1 img2)
  (<
     (* (image-width img1) (image-height img1))
     (* (image-width img2) (image-height img2))))
```
