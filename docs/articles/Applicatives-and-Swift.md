# [Applicatives and Swift – Stephen Celis](https://www.youtube.com/watch?v=Awva79gjoHY)
- you may not need a Monad

## Optional
- adds 1 more value
- it's a context
- wraps a value or it doesn't

## Functor
- the idea we can map on a value
- optional can be mapped on
- pass an optional a function
- lifts the function into the context of the optional
- mapping on a `.none` we still get nil
- the function you pass should be pure

## Monad
- Monad is stricter than a functor
- Monad means we can flatmap on something
- the function we pass can something that computes to the outer context