# [Protocols & Class Hierarchies](https://talk.objc.io/episodes/S01E29-protocols-class-hierarchies)
- Protocol Oriented Programming
## Class Hierarchies
- sometimes infelxible
- can only inherit from one object
- protocols allows polymorphism which can be more flexible

## Creaing an abstract class
Swift doesn't have them so we have to use crashing functions that need to be overriden

## Using inheritance they create some shape drawing functions
Now they convert it to protocol extension
- no need for `override` key word
- can replace classes with structs (supporting the case it's more flexible)

When adding a function to the protocol we have to bear in mind that for each object implementing it, you have to provide a conforming function in that object.

A small digression into the implementation of `CGContext`
## Overriding Protocol Extension Functions
- there are situations where you would want to do this
- fairly straightforward, just needs to be added to the protocol definition
* the reason for this is due to static vs. dynamic dispatching
* static means the protocol from the extension is set in stone not overriden

### Limitations of Protocol Oriented
- can't store properties

When should you create protocols and when not?

protocol ThisProtocol {
    func doSomething()
    <!-- func saySomething() -->
}

extension ThisProtocol {
    func saySomething() { print("something") }
}

struct AStructureOfSomeSorts: ThisProtocol {
    func doSomething() { a + b }

    func saySomething() { print("ssomething else!") } 
}

let this = AStructureOfSomeSorts()
this.saySomething() // something

var executedMap = false

let thisArray = [1, 2, 4]
for number in thisArray {

}

thisArray.forEach
let thisOtherArray = thisArray.map({ executedMap = true }).map
