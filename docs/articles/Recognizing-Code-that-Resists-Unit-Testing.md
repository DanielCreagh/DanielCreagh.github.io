# [Recognizing Code that Resists Unit Testing - Jon Reid](https://www.youtube.com/watch?v=FFk583ZtGd8)

Before Unit Tests were called Developer Tests.

## Reusing same code for 2 different purposes
- shipping
- verifying it

What fights this?

Jon Proposes that iOS community is weak on Unit Testing. Maybe back then but nowwadays it's different.

## Code that Resists Testing is trying to tell you something
❤️❤️❤️

When something causes pain (is difficult) pay attention to what's causing it.

## Be OK with problem free dependencies
FIRST
### F - Fast (milliseconds)
### I - Isolated
### R - Repeatable
### S - Self verifying
### T - Timely

FIRE
### F - Fast
### I - Isolated
like if a test passes when ran on its own but fails when run in the suite
- singletons
- globals
- static properties (not sure about this)
- persistent storage

### R - Repeatable
Not repeatable:
- random numbers
- sensors,
- current time or date 
- etc.

### E - Examinable
Something that isn't examinable is something that you can communicate to but won't give you any response e.g. logging, analytics

## Extracting difficult dependencies
Use default parameters to be able to inject difficult dependencies without having to change at call site
e.g. 
```
  func playTurn(diceRoll: Int = Int.random(in: 1...6)) {
    ...
  }
```

An alternative Value Creation: Extract Factory Closure -> include the factory closure as a variable on the object

## Mutable Object: Extract Abstract Interface 
UserDefaults -> not isolated, singleton too!
Use a protocol to mock it

- Working Effectively with Legacy Code
* any code without unit tests
- iOS Unit Testing by Example
