# Function Builder -> `@_functionBuilder` -> `@resultBuilder`
Every result builder must provide at least one static method called buildBlock(), which should take in some sort of data and transform it.

`static func buildBlock(_ components: Type...) -> Type`

It uses the variadic argument to indicate one or more objects of that type.

as an example:
```Swift
@resultBuilder
struct SimpleStringBuilder {
    static func buildBlock(_ parts: String...) -> String {
        parts.joined(separator: "\n")
    }
}

```

We can use the conventional approach of just using the raw function like so:
```Swift
let joined = SimpleStringBuilder.buildBlock(
    "Why settle for a Duke",
    "when you can have",
    "a Prince?"
)

print(joined)
```

But with our new result builder we can have a more declarative format:
```Swift
@SimpleStringBuilder func makeSentence3() -> String {
    "Why settle for a Duke"
    "when you can have"
    "a Prince?"
}

print(makeSentence3())
```

## example: `ViewBuilder`
`@ViewBuilder` is implemented as a function builder (introduced in Swift 5.1) using the @resultBuilder attribute. It allows us to return an "any View", a single view, as a composition of many other views with the syntax of simply lining up the views as individual statements. 

*Note: views can be placed on the same line but must be separate statements e.g. separated by a semi colon*

```Swift
@resultBuilder
struct ViewBuilder {
  // Converts a single expression into a view
  static func buildBlock<Content: View>(_ content: Content) -> Content {
    content
  }
  
  // Combines multiple views into one
  static func buildBlock<C0: View, C1: View>(_ c0: C0, _ c1: C1) -> TupleView<(C0, C1)> {
    TupleView((c0, c1))
  }
  
  // Handles conditional statements
  static func buildEither<TrueContent: View, FalseContent: View>(first: TrueContent) -> _ConditionalContent<TrueContent, FalseContent> {
    _ConditionalContent(storage: .trueContent(first))
  }
  
  static func buildEither<TrueContent: View, FalseContent: View>(second: FalseContent) -> _ConditionalContent<TrueContent, FalseContent> {
    _ConditionalContent(storage: .falseContent(second))
  }
}
```

## URLRouting
`URLRouting` is also using `@resultBuilder`:

```Swift
@resultBuilder
public enum ParserBuilder<Input> {
  @inlinable
  public static func buildBlock() -> Always<Input, Void> {
    Always(())
  }

  @inlinable
  public static func buildBlock<P: Parser>(_ parser: P) -> P where P.Input == Input {
    parser
  }
...
```
[Swift Parsing](https://github.com/pointfreeco/swift-parsing/blob/main/Sources/Parsing/Builders/ParserBuilder.swift)
