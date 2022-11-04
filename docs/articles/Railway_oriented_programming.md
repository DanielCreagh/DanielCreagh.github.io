# Railway oriented programming: 
## Error handling in functional languages 
### by Scott Wlaschin
[https://vimeo.com/113707214](Video)
@ScottWlaschin

---

F# (F for functional)

---
code design pattern
Ideal vs. Reality
-> Errors, Errors, Errors

---

Using "functional flow"

---
### Non Functional Design 
- Happy Path
- If something goes wrong, return early

---
### Functional
If something goes wrong, skip and go to end
Q: How can you bypass downstream (to the end)
Functions only have 1 ouput
If each function in a pipeline can fail, that's 3 possible error outputs

# Sum Types / Union types
(Sum Type vs. Product Type = ADT Algabraic Data Types)
`enum` is a sum type ;-)
`struct` a product type
There was a PointFree video on this

# Result Type
a sum type
a sum or Success or Failure (sum of 2)

# How do I work with errors in a functional way
MONAD
Maybe -> Optional
Monads Optional & Array are monads
they're weird but actually simple
it's something you can map a function on.

Phil Waddler - Original paper on Monads 

# A function is a section of railway track
Function Composition

Railway track switch to model an error on the railway section
Glue the switch routes together to represent the error scenarios

# Two Track model 
Two Track functions - making two track functions composable
Adapter Block
`bind`

# Fitting other functions into this framework
a "map" turns one track functions into two track functions
```
map: ('a -> 'b) -> TwoTrack<'a> -> TwoTrack<'b>
```

A dead end block:  () -> Void in Swift
```
tee: ('a -> unit) -> 'a -> 'a
```

In swift Void is another way of saying () i.e. () -> Void == () -> ()
() is called Unit (a unit of work)
In Kotlin they even call this Unit (if I'm not mistaken)

# Convert Exceptions into Failures
"Do or Do Not, there is no Try"

# Designing for Errors
Don't neglect the unhappy paths

putting all errors in one place (like an enum.Error)



