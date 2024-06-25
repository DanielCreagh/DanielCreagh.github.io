# [Test Doubles Are A Scam – Matt Diephouse](https://www.youtube.com/watch?v=7AGQ9dhWCX0)
> To err is human
- Alexander Pope

## Bad Tests Exist
- what is beautiful code
- not all tests are great
* slow
* hard to write
* fragile

## The best code is easy to test
## Unit tests vs. integration tests
unit tests = isolation tests
integration tests can be slow
- slow feedback loops
- harder to write
- usually end up not writing 

## Test doubles verify effects
Test doubles turn integration tests into unit tests
- dependency is another word for effect
- not a value, means it has some internal state or hitting the external world

## Programs combine logic and effects
referentially transparent/opaque
- determinism
- Test Logic and Test Effect SEPERATELY
Lot's of logic, easier to test
Effects should be fewer, harder to test
Try not to combine Logic and Effects
Move stuff into a smaller place, like effects
Pure Functions have no effects - safer and easier to test
good for code reviews, separate decisions from actions
effects start to turn into reusable components

## TEST DOUBLES ARE A SCAM
Test Doubles legitimize poor architecture
Test doubles are good for testing legacy code
- but that's all
Functional programming enforces purity (referentially transparity)
functional in a mathematical sense, 1 input -> 1 output
- no need for test doubles

### Haskel
Haskel has a Monad for an effect called `IO`

### Elm
Start with a model - App State
- message
-> returns a new copy of the model & a command (describes an effect)

## Functional Core imperative shell
functional core, easy to test
imperative shell, difficult to test (not as easy)

## Impure functional programming
Swift is impure which means effects can lurk anywhere
We take the approach of extracting the logic out into pure functions

## Value types for side effects
A stateless description of what should be done rather than actually doing it.
achieving pure

## The system executes values
"system" that handles like a controller of effectHandler.

## Functional UIKit
UIKit is OO.
Components == Objects


## class Root Controller: UIViewController
refactoring the viewcontroller actions out of the view controllers and into the root
this means view controllers don't have to know about any other view controlelrs
it just needs to provide a set of actions that make up its behaviour
- decoupling
- leveraging to achieve reusability
