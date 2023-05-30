# Tomás Ruiz-López - Demystifying Functional Programming
[Video](https://www.youtube.com/watch?v=zj7vlt0rzVo)

> functional programming is hard.

## Programming with functions
Accept input, do something, provide output

## Avoid Side Effects
Try to avoid impure functions - functions that have some kind of impact outside of the function or do not always return the specified type.

# Deterministic
- avoid randomness
- Same input always achieves the same output
- stateless
- pure

> How can i do something useful in my application without using side-effects

Using Combine.  __Not sure about these examples, it's not avoiding side effects at all__

## Model Side Effects as Values

# Composition
- matching output types with the input types of subsequent functions
- create large composed functions
- using map to propagate a nil (identity) across function composition

# Higher Kinded Types
A type which includes a generic type

# Flatmap
- propagating a nil (identity) across multiple functions when composing

> Monad is a data structure that allows us to compose using `.flatMap`

# Stick to conventional nomenclature 
Functional programming has a lot of esoteric terms.
It is better to adopt these so it can be applied in other areas.

# Monad Comprehensions
Composition meets imperative syntax
e.g. `if let`

# Take the best from OO and Functional
No need to choose