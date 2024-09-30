# [Ruby Conf 12 - Boundaries by Gary Bernhardt](https://www.youtube.com/watch?v=yTkzNHF6rMs)
## Test Doubles
- isolated unit tests
* allows test driven design
* outside in TDD (using components before the exist)
* fast tests!

Lose = tests can pass but in Prod it's wrong (as you're using real objects in Prod)

## integration tests are a scam - JD Rainsberger
- path testing and unit testing is linear i.e. the more you add the longer it takes to test

## Values
`+` is an example of a pure function - a local computation

The Value is The Boundary

## Paradigms
Procedural vs. Functional VS. OO
`each` indicates it's procedural (forEACH)

Mutating and Data separation from code

Functional Core Imperative Shell (again)
Functional Core is good for unit tests
Imperative Shell is good for Integration tests

FauxO style sounds like the Hybrid nature of Swift i.e. OO and Functional hybrid

> Values afford shifting boundaries
Not entirely sure what this means.

Less Stubbing and Mocking
more flexible and mobile code

Build larger systems out of many smaller FCIS

Twitter was already showing signs of being evil back in 2012




