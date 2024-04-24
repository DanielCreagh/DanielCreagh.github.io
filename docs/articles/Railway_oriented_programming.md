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

Untagged Union Types
( String | Int | YourType )

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

# [TechTrain: Scott Wlaschin — Railway oriented programming](https://www.youtube.com/watch?v=fYo3LN9Vf_M)

## Three Principles of functional programming
- Functions are Things (like bits of railway track)
- Composition
- Types are not Classes

## Functions are Things
just like strings and integers, they can be passed around
functions can be used as parameters for other functions
> A function is a stand alone thing

Object Oriented: Strategy Pattern

### Transformer
We can have a function that turns one function into another function.

### Composition (Lego)
All Pieces are designed to be connected.
You can connect any 2 functions together.
Take the output of a into input of b to make c.
You can't tell c is made from a and b.

Object Model = Request and Response
Functional = Input and Output

Pipeline.

## Types are not Classes
satically types functional languages

A type is a name for a set of things.

## Algabraic Type System
Algabraic means composable here (dc: i'm not sure about this)
Composing AND
Composing OR

### AND
Product type.

### OR
Sum type
Unions/descriminator
enum

> Lego oriented programming

### Piping
Syntax to indicate linking functions together.
Creating a pipeline.
in Swift it's common to see the piping aligned vertically

## Error Handling
We like to focus on the happy path.

### Result type
Modelling success of failure.
enum Result {
    case success
    case failure
}

"two track" model of error handling - Railway Oriented Programming.
a function transformer can turn the single input with double output (like our result)
flatmap (or bind) can be used to turn it into a double input where the input will be failure or success

- Different shapes of track
- function transformers

let this: Int?
func something(Int?) -> String?
this.map (something) -> String??
this.Flatmap (something) -> String?