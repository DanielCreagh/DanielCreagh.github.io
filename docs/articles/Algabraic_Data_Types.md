# [Algabraic Data Types](https://www.pointfree.co/episodes/ep4-algebraic-data-types)

There is a correspondance between Swift Type System and Algebra.

We can use this to shape our data types to make impossible state completely unrepresentable then the compiler will help us and tell us about our data types.

## The Algebra of Structs

### `Void` value 
It's strange it doesn't have any value apart from itself: `Unit`. Unit Type.

Functions by default retrun `Void`

`Void` can be considered like a boolean with only 1 option.

```
let _: Void = Void()
let _: Void = ()
let _: () = ()
```

### `enum Never {}`
Uninhabited type.
We can put `Never` and `Void` as associated types in `Pair<A, B>`

e.g.
fatalError returns `Never`

In Catageory Theory `Never` is called a `Bottom` and has a weird upside down shaped T symbol.

__Seems to be a Multiplication relationship between the members of a struct and the possible diffferent values of a struct__

What about values that can be infinite like string?

# Enum

`Either`
using either applying the same exercise as with struct we can see the combinations possible do not follow a multiplication pattern but more of a sum pattern.

`struct` -> product type -> `AND` logical 
`enum` -> sum type -> `OR` logical 

# Unit
The boys explore creating their own version of `Void`.

```
struct Unit {}
```

# Using Algebra to gain a better understanding
create `sum` and `product` functions 

An empty `struct` holds 1 value (`Unit`)
An empty `enum` holds 0 values (`Never`)

Adding `Never` to a `struct` annihilates the struct.
Adding a `Never` to an associated type of an enum case will remove that case from the equation.

```
enum is a sum type
struct is a product type
```

aim for sum types to avoid combinatorial explosions.

# Using URL session as an example
Disassembling `dataTask` to reduce potential for impossible states. 
We can already see a familiar pattern `Result` type.
`Result<(Data, URLResponse), Error>`
Using `Never` in result type.

---
__Having guard statements at the beginning of your function is a bit of a smell, that you've got into a state which is impossible and you should consider remodeling the input parameters.__

```
func something() -> Void {
    /... don't want side effects .../
    ()
}
```

# Why is the "value" of an empty sum type is 0 and product type 1
```
func sum(_ xs: [Int]) -> Int {
  var result: Int
  for x in xs {
    result += x
  }
  return result
}

func product(_ xs: [Int]) -> Int {
  var result: Int
  for x in xs {
    result *= x
  }
  return result
}
```

```
sum([1, 2]) + sum([3]) == sum([1, 2] + [3])
product([1, 2]) * product([3]) == product([1, 2] + [3])
```
Now, what if we used empty arrays?
```
sum([1, 2]) + sum([]) == sum([1, 2] + [])
product([1, 2]) * product([]) == product([1, 2] + [])
```
This forces sum([]) to be 0 and product([]) to be 1. There are no other choices. Therefore the empty sum is 0 and the empty product is 1.
```
sum([1, 2]) + 0 == sum([1, 2] + [])
product([1, 2]) * 1 == product([1, 2] + [])

sum([]) == 0
product([]) == 1
```

Void = 1 (product)
Never = 0 (sum)

Adding void to structure doesn't add anything
```
// Void = 1
// A * Void = A = Void * A
```
Never to a struct annihilates the struct
```
// Never = 0
// A * Never = Never = Never * A
```
But, adding 0 has a net result of leaving the value unchanged, and in types this corresponds to:
```
// A + Never = A = Never + A
```

Let’s go the other way. Consider this type expression:
```
// 1 + A = Void + A
```

# Optional
```
enum Optional<A> {
  case none
  case some(A)
}
```

# Monad
ID: empty state
map on it

ID of optional: nil
ID of array: []

`.map` f(x)

```
f(x) -> y
```

func doSomething(to aThing: YourType) -> AnotherType {
  do the stuff which is the morphism
}


let yourTypeInstance = YourType
yourTypeInstance.map(doSomething) // -> AnotherType

`.map`
`.flatMap`
`.compactMap` (is this applicable to Monad)
