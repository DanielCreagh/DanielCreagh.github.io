# Function Builder -> `@_functionBuilder` -> `@resultBuilder`
Every result builder must provide at least one static method called buildBlock(), which should take in some sort of data and transform it.


## example: `ViewBuilder`
`@ViewBuilder` is implemented as a function builder (introduced in Swift 5.1) using the @resultBuilder attribute.

The view builder pattern is the pattern that allows us to return an "any View", a single view, as a composition of many other views with the syntax of simply lining up the views as individual statements. 

Note: views can be placed on the same line but must be separate statements e.g. separated by a semi colon


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

ViewBuilder is implemented as a function builder (introduced in Swift 5.1) using the @resultBuilder attribute.


## Routing


