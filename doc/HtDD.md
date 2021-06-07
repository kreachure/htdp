# How to Design Data
If [HtDF](HtDF.md) part contained a recipe only, this one contains more.
The recipe is coming up for sure:

## Recipe

1. Structure if any
2. [A type comment](#type-comment)
3. [Interpretation](#interpretation)
4. Examples
5. [Template function](#template-function)
6. Template rules used

## Example
TLColor represents traffic light color.

### Type comment
```racket
;; TLColor is one of:
;; - 0
;; - 1
;; - 2
```

### Interpretation
```racket
;; Color of a traffic light; 0 is red, 1 is yellow, 2 is green
```

### Template function
```racket
#;
(define (fn-for-tlcolor c)
  cond(
    [(= c 0) (...)]
    [(= c 1) (...)]
    [(= c 2) (...)]
  ))
```
Note the `#;` - it comments out the whole following definition.
