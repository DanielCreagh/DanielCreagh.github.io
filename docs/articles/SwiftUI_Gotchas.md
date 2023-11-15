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

