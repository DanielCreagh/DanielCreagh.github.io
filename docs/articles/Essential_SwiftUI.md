# [SwiftUI essentials](https://developer.apple.com/videos/play/wwdc2024/10150/)
- Rich Feature Set
- Strongly advise to start with SwiftUI (implying don't bother with UIKit)
- Multiplatfrom

## Incremental Adoption
- you can use it how ever much you want
i.e. you can put it anywhere integrated with UIKit

## Which pet can do the best tricks?

## Views
- declarative
- state driven
- compositionable

Teaching pets to do tricks is imperative
- describe each set

Declarative and Imperative are not mutually exclusive

## Composition
- the code itself resembles the UI it creates

## View modifiers
- compositionable => chained
- reusable
- Custom Views

## State Driven

- `@State`
* binding within scope
- `@Binding`
* synchronises between objects

## SwiftUI out of the box
- dark mode
- accessibility
- localisation
- previews

## `.searchable` view modifier

## Low Level customisation available

## Widgets
SwiftUI is so portable you can use the same code to build a widget
- however, it is NOT write once, run anywhere
- there are a common set of API's
- Each platform has it's own set of API's also

# [What's new in SwiftUI](https://www.youtube.com/watch?v=CNMRV0F0w74)
## Side Bar
- lots of out of the box magic in iOS 18

## Control Widget
## MeshGradient
## SFSymbols
- inbuilt animations 🤩

## Customise MacOS Windows
- push window
- remove chrome

Vision OS let's you trigger animations when people LOOK at them!!
- Create custom animathover over animations in Vision OS

## `.onModifierKeysChange`

## iPad 
- pencil gestures
* double tap
* squeeze

## Macro for environment keys
## default accessibility label augmentations

## mixing colours

## Custom shaders
- precompiled to avoid graphics stutter

## Scrollview enhancements
- Additional nobs

## Swift 6 Language Support Mode
- View default to run on @MainActor
- Watch "Migrate your app to Swift 6"

## UIKit can use SwiftUI animations
- UIViewRepresentable
