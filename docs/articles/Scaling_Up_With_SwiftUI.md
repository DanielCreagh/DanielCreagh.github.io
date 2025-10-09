# [Scaling Up With SwiftUI: Migrating iOS Apps To SwiftUI - Aryaman Sharda - SwiftCraft 2024](https://www.youtube.com/watch?v=YJ_tMXrjPOM)

- under 9 months

## Get the team to know the basics
- workshops

## Tried different Architectures
- shortlisted screens and features to experiment with
- even doing same screens with different archs to compare

## What are we looking for 
- Separation of business logic and view
- testability
- structured data flow
- scalable
- Modular
- interopable between UIKit and SwiftUI
- separation between view and back end response
- support DI
- easy onboarding
- cross platform support

(He mentioned taking a couple of years to completely transition to SwiftUI)

## Iteration on different archs
Landed on MVVM
- fairly contravercial when using this pattern with SwiftUI

App and Widgets use the new pattern

## Progressively convery each component
It became obvious the components lacked SwiftUI components

## How to achieve the transition with minimum disturbance

## Onboarding support
- Team meetings
- mentoring
- office hours
- learning resources

`SwiftUI Guidelines.md` <-- checked into repo

## Developer Tooling
improve DevEx
- get rid of storyboards
A tool to convert Storyboard to SwiftUI

## Modularization
from monolith to modules

## Code Review
- linters
- pre-commit hooks
verify styling, accessibility, localisation, 

Faster development speed with SwiftUI!!!

## Navigation
inserting Swiftui into UIKit flows
- were restricted by old iOS version support

### Requirements:
- screens decoupled from navigation
- MVVM Support
- Flexible Navigation
- Simple & Scalable
- Separate Flow Control
- Deep Linking Ready
- Nested Nav
- Multiple presentation styles (modal, present, bottom sheet)
- Integrate with UIKit when needed
- Integrate with DI

Cooridnator contains a navigation path
- have a navigation stack view (coordinator view)
- add the coordinator to the environment
- 

View Model creates a separation between the view and the navigation

## What worked well
- Code Reviews (GitHub labels to indicate new SwiftUI Code was being pushed)
* code review meetings (mob reviews)
- Quick Wins
* good for motivation
* made a design system in SwiftUI
* Had a library ready to go
* a good metric - time to first win!
- Balancing Deadlines
* Aligning Teams and Managing Deadlines
- Improving Test Coverage!
- Accesibility From the Ground Up
* Design System

## What Didn't Work
- managing different skill levels
- was slow to keep everyone at same level
- context switching
- new viewModifiers <----- i've heard this reported as an issue with SwiftUI a lot
* raise awareness of new modifiers
- supporting iOS15

## Wrapping up
- learning and skill building
- Conversions
- Onboarding (the experiments)
- Good Communication
- Focus Time
- Investing in Developer Tooling






