# Algabraic Data Types

[Video](https://www.pointfree.co/episodes/ep4-algebraic-data-types)

There is a correspondance between Swift Type System and Algebra.

We can use this to shape our data types to make impossible state completely unrepresentable then the compiler will help us and tell us about our data types.

## The Algebra of Structs

### `Void` value 
It's strange it doesn't have any value apart from itself: `Unit`.

Functions by default retrun `Void`

`Void` can be considered like a boolean with only 1 option.

### `enum Never {}`

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

# Using Algebra to gain a better understanding
create `sum` and `product` functions 

An empty `struct` holds 1 value (`Unit`)
An empty `enum` holds 0 values (`Never`)

Adding `Never` to a `struct` annihilates the struct.

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


