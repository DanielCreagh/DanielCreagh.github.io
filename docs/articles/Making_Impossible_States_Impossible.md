# "Making Impossible States Impossible" by Richard Feldman
[video](https://www.youtube.com/watch?v=IcgmSRJHu_8)

## Elm CSS
Using elm to generate VALID style sheets

### at rules
@charset
@import
@namespace

these have weird rules which will invalidate your CSS if not followed

writing the template as a list, they're all the same type so can be arranged in any order
this will break the rules set for the at-rules.
we can try and sort them before generating
we can also make tests
> they have flaws and can be fragile

## Make representing invalid stylesheets impossible
Instead of a list of the same type, make a data structure which enforces the valid structure.

This means a lot less testing because the compiler is ruling out certain things that we would have previously tested for.

> Tests are good, impossible is better!

## Another example using user prompts
- identifying impossible states
- using data structures to eliminate potential impossible states

having a list with "at least one"
- NonEmpty array (non empty monad) (PointFree guys have a library)
- ZipList, a more complex list which will always have a current value - using more complex data structures to make further work easier by not having to accomodate for nil values etc.

## Retrofitting
exposing access data functions, hide previous implementation and only allow access through the "new improved" impossible state-less structures

# Summary
> Do we want 2 maybe's or a union type (`enum`)
> Retrofitting, building without breaking previous 

maybe => optional 
just => .some(optional

enum Optional<T> {
	case nil
	case some(<T>)
}

( Type1 | Type2 ) Either<Type1, Type2>
( thing1: Type1 | thing2: Type2 )
