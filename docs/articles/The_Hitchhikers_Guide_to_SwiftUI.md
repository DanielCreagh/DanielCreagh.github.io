# The Hitchhiker’s Guide to SwiftUI - iOS Conf SG 2021
[Video](https://www.youtube.com/watch?v=0MAc-hjvKqw)

---
# Summary according to ChatGPT
    The speaker discusses their experience using Swift UI, a tool for building projects for Mac OS, iPad OS, and iOS, to create an app called Orbit. They mention that Swift UI is still in an early stage and there are some things that are still missing or require workarounds, but overall it is a good tool to use. They also emphasize that it is important to consider the specific behaviors of each platform, rather than just writing code once and running it on all platforms. The speaker mentions that custom UI is easy to make with Swift UI, and suggests using it for projects that have a lot of shared code and custom UI, as well as for prototyping and testing ideas. They also discuss some challenges and limitations they encountered while using Swift UI, such as issues with layout and animation, and offer some tips and tricks for working with the tool.

# Breakdown according to ChatGPT
- The speaker is running a software studio and has recently been working on an app called Orbit, which is written in Swift UI
- Swift UI is a tool for building projects for Mac OS, iPad OS, and iOS, and is still in an early stage
- It is important to consider the specific behaviors of each platform when using Swift UI, rather than just writing code once and running it on all platforms
- Custom UI is easy to make with Swift UI
- Suggested uses for Swift UI include projects with a lot of shared code and custom UI, as well as prototyping and testing ideas
- Challenges and limitations encountered while using Swift UI include issues with layout and animation
- Tips and tricks for working with Swift UI are shared

---
# TOC
- State of SwiftUI
- When to use SwiftUI
- Structure
- ShortComings
- SwiftUI and UIKit
- Text Editor
- Custom Picker View
- Presentation of Different Sheets
- Modal in Presentation
- Conclusion

# State of SwiftUI
- Still in progress at time of recording
- useful for cross platform development

# When to use SwiftUI
- Start with Widget

# Structure
- Decomposing and composing Views
- Useful for creating different screens/structures for different platforms

# Shortcomings
- things missing, like pull to refresh

# SwiftUI and UIKit
- Easy to combine
- `updateUIView` a nice function for telling UIKit that SwiftUI has updated something

# Text Editor
- customising out of the box components

# Custom Picker View
- an example of cusomising out of the box components

# Presentation of Different Sheets
- navigation

# Modal In Presentation
- constraining user, prevent them from dismissing important views
- block the slide down gesture
- in the presenters experiences, it was necessary to use UIKit to achieve this

# Conclusion
- Still early (2021)
- Good time to get started
- All platforms are different
- Things are constantly changing
- Tricky to estimate time
- Some workarounds might be required (like the Modal in Presentation)
- UIKit & AppKit can come in handy

