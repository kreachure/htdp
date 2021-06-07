# How to Design Data
If [HtDF](HtDF.md) part contained a recipe only, this one contains more.
The recipe is coming up for sure. And more.
1. [HtDD recipe](#recipe)
2. [An example](#example)
3. [Data structures](#data-structures)

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

## Data structures
1. [Simple atomic data](#atomic-data)
2. [Intervals](#intervals)
3. [Enumerations](#enumeration)
4. [Itemizations](#itemization)
5. Compound data (structures) 

### Atomic data
Atomic data has no structure, it's _atomic_: a speed of a car, a hight of a plane, a name of a cat.
Atomic data can be _distinct_ and _non-distinct_.
#### Atomic non-distinct
...is a continuum: plane height, cat age. So, we can't see all distinct values.
For atomic non-distinct, we need `(... x)` template using the argument.

#### Atomic distinct
...like name of a city is a set of distinct values we can enumerate. 
For atomic distinct, we don't need an argument, so the template is `(...)`.

### Intervals
Interval is a subset of _Atomic non-distinct_: Integer[0,10] is an _interval_, and it's also _atomic non-distinct_.

So, for _intervals_ we use `(... x)` template.

### Enumeration
Enumeration is a **one of a kind** template.
So, we are choosing a value from a fixed list of distinct values.
Template for this type is _condition_:

```racket
(cond [Question Answer]
        [Question Answer]
        [Question Answer]))
```

### Itemization
...or classification. 
Like _enumeration_, it's a _one of_ choice. 
Though here inside the chosen position, we'll need to work with data further.
A good example is three proximity distances for a radar:

```racket
;; Radar proximity is one of:
;; - Number[0, 5) is "close"
;; - Number[5, 30] is "near"
;; - Number[> 30] is "far"
;; So template is:
(define (fn-for-radar-proximity p)
  (cond [(and (>= p 0) (< p 5)) (... p)]
        [(and (>= p 5) (<= p 30)) (... p)]
        [else (... p)])
```
