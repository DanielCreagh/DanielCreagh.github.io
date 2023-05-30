# [Inspecting SwiftUI's Layout Process](https://talk.objc.io/episodes/S01E318-inspecting-swiftui-s-layout-process)

- implementing a simple slider to experiment with
The text size varies so we want to see how the size changes
Using overlay & GeometryReader
> amazing how quick they added the overlay compared to how long it would take in UIKit

> What's the difference between a layout and a view?

This seems to be the main crux of the video:
```
Thanks to the Layout protocol, this is no longer the only way we can find out the size of a view — we can wrap the view in a custom layout that logs its calls. We write the LogSizes layout, in which we assert that there's just one subview, and we forward the method calls to sizeThatFits and placeSubviews to that subview, without modifying any of the parameters
```

[Here](https://developer.apple.com/documentation/swiftui/layout) is where the magic happens
