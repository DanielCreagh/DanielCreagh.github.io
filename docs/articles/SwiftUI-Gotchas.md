# SwiftUI Gotchas
## Background Colours on Lists and Forms
obviously
```Swift
.background(.purple)
```
~should~ doesn't work on `List` or `Form`, you have to remember to clear out the scroll view background like so:

```Swift
.scrollContentBackground(.hidden)
.background(.purple)
```

## Gap underneath `List`
[Answer](https://www.hackingwithswift.com/forums/swiftui/weird-gap-between-stack-and-list/15655)
Weirdness... takes me back to CSS days.

## Button Styling isEnabled in Environment
This is a nice one.
```Swift
struct MyButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(!isEnabled ? Color.black : (configuration.isPressed ? Color.red : Color.blue))       
    }
}
```
Using the environment to access the is enabled, seems weird that `isPressed` is accessible without the environment.

## TabBar Background Colour
This is one of those counter intuitive situations. Not sure how this kind of thing happens, I think maybe they're using the old `UIBabBar` under the hood. Anyway, the only I way i found to change the background colour of the TabBar in SwiftUI without weird behaviour i.e. changing colour when scrolling, was this:
```Swift
    TabView {
        ... tab bar items   
    }
    .onAppear() {
      UITabBar.appearance().backgroundColor = .white
    }
```