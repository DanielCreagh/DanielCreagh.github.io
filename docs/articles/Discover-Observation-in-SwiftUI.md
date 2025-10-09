# [Discover Observation in SwiftUI](https://developer.apple.com/videos/play/wwdc2023/10149)
## What is Observation
- track changes to properties
they use macros

SwiftUI can detect which properties from the model are used.

- Using computed property
properties accessed within the computed property also triggers an update

(Macros are worth learning more about)

## Property Wrappers
use @State property

@Environment 

@Bindable
- lightweight
- Allows properties to be bindable on that type
- you can mutate properties from the Swiftui if is binded

### FLow
Is the state part of the view = `@State var`
is it global = `@Environment var`
just need bindings = `@Bindable var` (bits of the object to subscribe to)

## We can remove some noise from the @Published annotation
