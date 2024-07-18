# [Migrate your app to Swift 6](https://developer.apple.com/videos/play/wwdc2024/10169/)
Sometimes clean architectures can hide complex concurrency.

# Swift Concurrency
- Actors

Reference types allow shared mutable states to be passed around. This is not good for concurrency.

> Swift 6 enforces full inforcement of "data isolation".
can catch concurrency errors at compile time

Xcode 16 has Swift 6

Data Isolation can be enabled in the app settings in xcode
- choosing Watch extension to enable it first as it's probably a smaller code base
- warnings

> Global values are loaded lazily
lazy initialization can cause data races - in Swift this is managed at exec time and is avoided

Possible to remove some of previously put @MainActor annotations.

### Local Reasoning
not having to be concerned about threads executing outiside of local context

If there's no control of the outer context threading we can double check in local context.
- `MainActor.assumeIsolated`
this will assert at run time

use `@preconcurrency` annotation to achieve same thing

## Lot's of warnings! Don't Panic.
- usually most stemming from a few issues
- always worth using latest Xcode beta to look at the warnings that will come up in your code

Take your time
Eliminate simple issues first
Refactor to improve code once Swift 6 is enabled
See the migration guide for more examples