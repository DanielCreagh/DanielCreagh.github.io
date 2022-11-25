# Protocol Oriented Programming
[WWDC Video](https://developer.apple.com/videos/play/wwdc2015/408/)

## OOP
### Classes are Awesome
- Encapsulation
- Access Control
- Abstraction
- Namespace
- Expressive Syntax
- Extensibility

## Types are Awesome
It can all be done with `struct`s and `enum`s.

### Classes are awesome because of inheritance
1. Implicit Sharing
Defensive copying
Inefficiency
Race Conditions
Dead locks

## Swift Collections are all value types
- One superclass - Choose Well
- Single Inheritance weight gain
- No retroactive modeling
- Superclass may have stored properties

So using OOP we have options to avoid all these complexities but it's not 100% fool proof.

### Lost type relationships
Force down cast is a smell that some type relationship has been lost.

## We need a better Abstraction Mechanism
-> Procotols

# Swift is a Protocol Oriented Programming Language
demonstration of how to use protocols to make stuff extensible
- use extensions to create implementations of protocols on opaque types
- decoupling

# Notes:
[introduction-protocol-oriented-programming-swift](https://www.toptal.com/swift/introduction-protocol-oriented-programming-swift)
[Podcast](https://www.swiftbysundell.com/podcast/71/)