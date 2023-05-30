# Mysteries of SwiftUI Text View
## Natalia Panferova
[Video](https://www.youtube.com/watch?v=-l7RsBENLbI)

- Many of the common view types contain text.
- Labels are TextViews

# Text in different contexts
- Inheriting from the parent view (or Stack)
- Can be rendered into a different string due to localization
- TextViews can be initialised in a few different ways depending on the format/type of string

# String Variable vs. String Literal
Two different initializer
1. StringProtocol
2. StringLiteral -> String interpolation

> I feel this is a bad API design, can be easily confused.

__String Literal means it will be localised, it uses the argument as the key.__

## StringProtocol
```
let str = "Hello"
Text(str)
```

## StringLiteral
```
Text("Hello")
```

StringLiteral can also parse markdown! 

# `.timer`
this looks amazing! :-D

# Nested Text Views

# Interpolation vs. concatenation
Interpolation is preffered over concatenation.

# Style Priorities
Same as CSS? closest style to the object takes priority. (I think?)

# Attributed Strings
Useful for rich text





