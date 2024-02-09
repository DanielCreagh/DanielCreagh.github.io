# Swift Macros
[Write Swift macros](https://developer.apple.com/videos/play/wwdc2023/10166/)

## Create a macro using Xcode's macro template
`#stringify`
- there is a template for creating a package with your macro in it
- make sure your macro is well tested (because the implementation is well hidden)

### building blocks
- declaration
- implementation
- easy to test

## Macro roles
- @freestanding(expression)
- @freestanding(declaration)
- @attached(peer)
- @attached(accessor)
- @attached(memberAttribute)
- @attached(member)
- @attached(conformance)

## Write a SlopeSubset macro to define an enum subset
## Inspect the syntax tree structure in the debugger
## Add a macro to an Xcode project
## Emit error messages from a macro
## Generalize SlopeSubset to a generic EnumSubset macro

# Expand on Swift Macros
[WWDC Video 2023](https://developer.apple.com/videos/play/wwdc2023/10167/)

## Why macros?
- Eliminate boilerplate
- Make tedious things easy
- Share with other developers in packages

## Design philosophy
- Distinctive use sites
- complete  type checked, validated
- additive (can't remove or change existing code at call site)
- Macros should not be magic

## Translation model

## Macro roles
### `@freestanding(expression)`
expands into an expression

### `@freestanding(declaration)`
expands into any number of declarations (of `var` `let` etc.)

### `@attached`
has access to inards

### `@attached(peer)`

### `@attached(accessor)`
e.g. providing getters and setters

### `@attached(memberAttribute)`
e.g. adding the property wrappers to members 

### `@attached(member)`

### `@attached(conformance)`

## Macro implementation
```
import SwiftSyntax    
import SwiftSyntaxMacros    
import SwiftSyntaxBuilder    
```

## Writing correct macros
- `static func expansion`
- errors should be handled
- you can even add "FixIts" if someone is using your macro incorrectly
- tests obvs!
- don't use data outside of what the macros is attached to (pure!)

### Name Specifiers
#### `overloaded`
Creates a declaration with the same base name as the declaration it's attached to (attached only)
#### `prefixed (‹some prefix>)`
Creates a declaration whose base name is < some prefix> followed by the base name of the declaration it's attached to; prefix can start with $ (attached only)
#### `suffixed (‹some suffix>)`
Creates a declaration whose base name is the base name of the declaration it's attached to followed by <some suffix> (attached only)
#### `named (‹some name>)`
Creates a declaration with the base name ‹some name>
#### `arbitrary`
Creates a declaration whose name cannot be described by any of the rules above

## Testing
- unit tests
- TDD is ideal

# [Mastering SWIFT MACROS](https://www.youtube.com/watch?v=SyWMAYLcYC0)
## Your code isn't being executed
- you can't pass values into it, it has to be adjacent to the object it's being attached to

## User TDD
- because why not?
- macros lend themselves to TDD due to the "text" output

## Leverage Swift Syntax
- this is a library which can generate the Syntax to be returned by your macro function
- there's a page called Swift AST Explorer that will give you the syntax tree for you to inspect
- Fakery lib that will build lots of fake data for you
- you can't read files from a macro - macros don't care about your business logic, it's just syntax
- performance is key; compilation time

