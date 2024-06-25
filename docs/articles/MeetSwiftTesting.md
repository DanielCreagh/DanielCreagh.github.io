# [Meet Swift Testing](https://developer.apple.com/videos/play/wwdc2024/10179)
## Building blocks


## Building blocks: @Test functions
- Test Arrtibute - makes a function a test function

## Building blocks: Expectations (#expect and #require)
- `#expect` (assert)
- `try #require`

## Building blocks: Traits
- add info about a test
- customize tests
- modify test behaviour
- there's a bug trait - annotation to say not executing test because of a bug

## Building blocks: @Suite types
A struct which bundles tests together that can be exectured togheter
- nesting test suites

## Building blocks: Designed for Swift
## Common workflows
## Common workflows: Tests with conditions
- you can skip tests
- useful if you want to skip a test because it's flakey or whatever

## Common workflows: Tests with common characteristics
- customs tags
- group tests by tag
- tag nested test suites
- run all tests with a particular tag

## Common workflows: Tests with different arguments
- repeating tests with different arguments
- paramterised tests - add arg to func sig
- `@Test(arguments: )`

## Swift Testing and XCTest
all the different `XCTAssert`s, just a single `#expect`.
User `#require` instead of `#expect` to halt the tests.
They can coexist in the same target

## Open Source

### Easy to run from command line and also Visual Code

# [Go further with Swift Testing](https://developer.apple.com/videos/play/wwdc2024/10195)
Swift Testing available in Xcode 16

## Why we write tests
## Challenges in testing
## Writing expressive code
- Readbility is important

## Expectations
- error handling
- `#expect(throws:)`


## Required expectations
## Tests with known issues
## Custom test descriptions
## Parameterized testing
## Organizing tests
## Test suites
## The tag trait
## Xcode Cloud support
## Testing in parallel
## Parallel testing basics
## Asynchronous conditions
