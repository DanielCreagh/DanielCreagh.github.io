# [Generalize APIs with parameter packs](https://developer.apple.com/videos/play/wwdc2023/10168/)
## Generics and Variadics
Variadiac Parameters allows a function to accept any number of values of a specific type.
- The function can't accept varying types
- Overloading can be used to accept varying number of type parameters
Parameter packs solve this problem.
## Available in Swift 5.9

## What do Parameter Packs mean in code
A Parameter Pack can hold any number of values or types
- Type Packs: can hold any number of different types
- Value Packs: can hold any number of different values
They're used together.
Similar to collections - using iteration.
Parameter Packs are different because each element has a different static type
use the keywork `each` to declare your pack of types
### Repetitiions Pattern
e.g.
`repeat Request<each Payload>`

`each Bool, Int, String`

They produce comma separated lists of types.
- Tuples, 
- function parameter lists
- ???

## An example function signature

`func query<each Payload>(_ item: repeat Request<each Payload>) -> (repeat each Payload)`

- we use the first `repeat` to instruct the function to execute on each item in the parameter pack
- the second `repeat` is indicating that the return object is itself another parameter pack.

## we can add constraints using the usual protocol conformance pattern

We can also use the conventional "non empty" pattern to the function parameters.

## Using parameter packs
`repeat (each item).evaluate()`

## Throwing errors
Can be useful if you want to escape early from the "iteration".

enum Thing {
    case string(String)
    case bool(Bool)
    case int(Int)
}

let arrayWithDifferentType = [Thing]()

func useArray(param: [String]) -> Thing 
func useVariadic(param: String...) -> Thing



struct NonEmptyArray<Type> {
    let head: Type
    let tail: [Type]
}

let myArray = NonEmptyArray(head: "egg", tail: [])

myArray.first
myArray[0]

struct Book<Page> {
    let currentPage: Page
    let previousPages: [Page] // could be empty
    let nextPages: [Page] // could be empty

    func tearOutPages(pageNumber: Int) -> Bool {
        if pageNumber == currentPage { return false }
        // tear out any previous or next pages
        return true
    }
}

let book [Page] = []
var currentPage: Int = 4
// Bang!
