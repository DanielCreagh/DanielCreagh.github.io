# Eliminate data races using Swift Concurrency
A more holistic view of Swift Concurrency
[video](https://developer.apple.com/videos/play/wwdc2022/110351/)

---
# Sea of Concurrency

---

# Isolation
> Data is not shared in a manner that can cause race conditions

---
## Task Isolation
- sequential
- asynchronous
- self contained

these boats are independent
- communication between boats 
- `structs` shared between the tasks are copies and maintain the isolation when communicated (🍍)
- `classes` reference shared between tasks (🐓)
* shared mutable data is prone to data races

---
# `protocol sendable`
- `struct` can be sendable
- `class` CANNOT be sendable (unsynchonised reference type)
- `enum` can also be sendable as long as all of their instance data is also sendable

sendable constraint comes from the Task definition.
Swift compiler will error when we try to share a non-sendable object

---
Use `@unchecked Sendable` with caution

---

`Task.detached` 
- can capture variables and compiler will check them

---
`@Sendable` can be used on functions

---
# Actor Isolation

---

Actors are islands
- self contained
- only one task can execute on an actor at a time
- `await` is a potential suspension point with tasks trying to access an actor
- are reference types, but they have their own independent state 
- they are implicitly sendable

# non-isolated code
- e.g. a detached task within an actor
- does not run on an actor
`nonisolated` keyword
- needs `await` to access members of the actor

# Actor Isolation Summary
- Each actor instance is isolated from everything else in the program
- Only one task can execute on an acrot at a time
- Sendable checking occurs whenever you _enter_ or _exit_ an actor
- actors themselves are `sendable`

# `@MainActor`
- main thread
- user interface
- contains a lot of state
- can only run one job/task at a time (still)

> Visualize and Optimize Swift Concurrency talk (do this next week?) <need video link>

# When writing your actor
- Think transactionally
- Keep async actor oerations simple

# ACtors execute the highest priority tasks first
- Tasks run code in order

# `AysncStreams` deliver elements in order

# Incremental Introduction
sendable non-conformance will be warnings rather than errors in Swift 5
`@preconcurrency` attribute will silence the warnings
- Complete Checking in (Swift 6)

Eliminate data races using Swift Concurrency