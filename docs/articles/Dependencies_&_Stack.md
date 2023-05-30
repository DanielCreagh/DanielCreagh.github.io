# [Point-Free Live: Dependencies & Stacks](https://www.pointfree.co/episodes/ep221-point-free-live-dependencies-stacks)

# Dependencies
New library which can be used in isolation from TCA
- use a single entry point style architecture (like TCA)
- network request can be thought of as a function
- SwiftUI View's are a great example of single entry point i.e. the `Body` object
- made it work on other platforms
- UIKit are definitely NOT single entry point systems

## Dependencies vs. Environment
- Environment is built by Apple
- Dependencies fill in the gaps in Environment e.g. Environment can't be used in server side apps

Putting dependencies in a global object - this isn't as bad as a singleton pattern although it is a singleton.

TaskLocals? 

`withDependencies` a way of propagating dependencies to child models

## Dependencies are held in memory during the livecycle of the app
- shouldn't be a problem, keep your dependencies lightweight

`withEscapedDependencies` this is the same thing but bridges the `async await` world with the "old world"

## Dependency Inversion
Dependenct Inversion is essentially describing dependencies as protocols/interfaces rather than the actual dependency object itself e.g. "SomethingProvider" rather than "Something".
- break the connection between the `.live` and the interface

## Dependencies can depend on each other
- possible but probably not a good idea

# Navigation
## Tree Based Navigation
- enums that represent navigation from each model
pro: Concise, more self contained, testable
con: can't really do recursive stuff, can get complex very quickly
- it couples navigation and destinations, if you navigate somewhere you need to know the model it requires
- at the root it's using iOS16 new stuff which is still buggy

## Stack Based
SwiftUI `NavigationStack`
pro: can handle complex recursive navigation paths
- decouple the screens
con: difficult to test

INteresting stuff about making reference type hashable
+ nonisolated keyword, wouldn't mind knowing why he needed to do that (52:00)

---

# ChatGPT Summaries:
## Dependencies
In a conversation between Brandon and Stephen, they discussed their library "Dependencies," which was initially designed for their Composable Architecture but has been used by developers for other applications as well. Dependencies is a library for managing dependencies in single entry point systems such as Composable Architecture, server-side apps, command-line apps, and SwiftUI views. They modeled the API after SwiftUI's environment, allowing for overriding dependencies at different key scopes. They also made the library compatible with non-Apple platforms such as Linux, Windows, and SwiftWASM. The library has been used on their website and has made the code more organized and efficient.

## New dependency tools
Stephen is discussing improvements made to APIs and the ability to control dependencies in the code. The APIs focus on scoping dependencies and providing fine-grain control over dependency overrides across different boundaries. The team has added two main APIs that help fill gaps in the design and they accept pull requests and conversations on GitHub discussions. The team also believes that task locals empower what is happening in the code by providing a scoping mechanism for dependencies. They use task locals to ensure that dependencies are overridden within a specific scope, and this allows for a global blob of dependencies to be a safe thing to do. Additionally, they allow for extending the lifetime of dependencies in certain cases.

## `withDependencies(from:)`
In this conversation, Stephen and Brandon discuss the use of the withDependencies(from:) method in SwiftUI to tie dependencies to a model. This method allows all dependencies to be passed to the model, ensuring that dependencies are not lost when a child model is created. The method works by using the same scoping mechanism that is used for overriding dependencies in general. The conversation also covers a new feature related to extending the lifetime of a dependency, which is built on task values and provides a safe way to mutate dependencies. There is also a discussion on memory management with regards to holding dependencies in memory for the entire duration of the app. The idea is to make dependencies lightweight so that they do not consume too much memory.

## withEscapedDependencies
Stephen and Brandon are discussing the EscapedDependencies feature, which allows for bridging between old-style escaping closures and the new async world in Swift concurrency. This feature allows passing dependencies through an escaping boundary and can be used with old code written in Combine or Rx Swift old foundation APIs, dispatch APIs. They also mention the Dependency library, which allows breaking the connection between the live implementation and the interface and inversion of dependencies. They note that it's possible for one dependency to depend on another and that as long as dependencies form a tree or a graph without any cycles, it will work fine.

## pointfree.co
Stephen and Brandon were discussing the use of the IO type to power all side effects on the pointfree.co website, which allows for the propagation of dependencies throughout the website and enables writing tests easily. They also mentioned that the isowords repository is already using dependencies as well. However, one potential issue they acknowledged is that accessing a live or a dependency that isn't found will throw a runtime warning or error, which they hope to address in the future with new swift functionality.

## Navigation stacks
In this conversation, Brandon and Stephen discuss their recent project, a SwiftUI-based stand-up app. They have finished a long series on Modern SwiftUI, and now they want people to port the codebase and build it in their own way. Brandon shares his screen to demonstrate the app's navigation stack, which uses state-driven navigation, dependencies controlled, and type-safe identifiers. The app is a moderately complex one, which allows users to add, edit, and delete attendees, start a new meeting, and transcribe speech. They encourage people to fork it and rebuild it in their own way.

## Tree vs. stack navigation
Brandon discusses the state-driven navigation used in their application, specifically tree-based state navigation. Each screen describes an enum of all the different places that can be navigated to, with different destinations such as alerts, sheets, and detail screens. The application's entry point allows the user to choose where to navigate, and each node presents branches for further navigation. This tree-based navigation is contrasted with stack-based navigation, which uses a binding of a collection to provide a flat array of values interpreted as drill-down layers of the navigation stack.

## Tree/stack pros/cons
Brandon is discussing the pros and cons of two different styles of navigation in an application. He explains that tree-based navigation is concise, easy to test, and unifies all forms of navigation under one API. However, it cannot express complex or recursive navigation paths, and it couples navigation destinations together. Furthermore, there are bugs in these APIs, even when using the latest iOS 16 navigation destination that uses a binding. Brandon highlights that these bugs are a legitimate showstopper.

## Refactoring tree to stack
ERROR

## Refactor pros/cons
Brandon discusses the pros of fixing bugs and the application working smoothly. However, there are also cons, such as impreciseness and runtime bugs. He demonstrates how they can deep link into any state and construct a path, but the screens are mostly inert, so they can't do anything. They contemplate writing tests or fielding more questions but are mindful of people's work schedules.

## Final Q&A & Conclusion
During a conversation, Stephen suggests taking a poll to see what the chat is interested in for the next five to fifteen minutes. Brandon suggests writing tests or answering questions, and polls the chat. The majority chooses answering questions over writing tests. They then answer questions about navigation in standups and how to define dependency when the init is async. They explain that they think actors are great for dependencies but the detail should be hidden away in the live implementation. They also discuss their future plan to build a Composable Architecture using all the new features and to tour it through the standups app.