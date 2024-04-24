# WWDC Embrace Swift Generics
[video](https://developer.apple.com/videos/play/wwdc2022/110352/)

---

> Abstraction separates ideas from specific details.
In Swift we can Abstract Types
e.g. of abstraction -> refactor code out into a smaller function
- details are moved into the function
- the idea is represented in the function name

1. Model Code with Concrete Types
2. Identify common capabilities
3. Build an interface
4. Write generic code

# Model Code with Concrete Types
## function overload
* same function with different type in the signature
- leads to repetetive implementations

# Identify common capabilities
## Polymorphism
Allows one peice of code to have many behaviours depending on context.
- Overload = ad-hoc Polymorphism (not a general solution)
- Subtype e.g. class hierarchy/inheritance (reference semantics, must be overriden)
* overriding only surfaces at runtime
* boilerplate inducing
- Generics = parametric Polymorphism (uses types as parameters)

# Build an interface
## Using a Protocol 
> A protocol seperates idea from IMPLEMENTATION details (a form of abstraction)
The idea is expressed in an interface.

### Protocols have Associated Types
associated type = a generic specification on a protocol

# Type Parameters
represented by a identifier in angle brackets.
Type parameters can conform to Protocols.
Protocol confonformances can be put inside the angle brakcets or in a trailing `where` clause.
Use `some` keyword to simplify the syntax of the `where` clause or inside the angle brackets.
We can see `some` being used a lot in SwiftUI.

Is there any point using `some` for local variables?
Opaque Type & Underlying Type

using `some` in a return value means all the returned values types must be the same.
- `@ViewBuilder` annotation bypasses this constraint.

## using `any` instead of `some`
`any` means we can store any type in a container.
> An existential type
`any` is a form of type erasure.

Type is not known at compile time, only runtime.

the compiler can convert `any` Animal to `some` Animal by unboxing at passing it to the `some` Animal patameter.

_Note:  >= Swift 5.7 only_

# `some`
- underlying type is fixed
- Guarantees type relationships

# `any`
- Holds an arbitrary concrete type
- Erases type relationships 

Rule of thumb: Use `some` by default

check out [Design protocol interfaces in Swift](https://developer.apple.com/videos/play/wwdc2022/110353/)

`AnyObject` 
`Any` 