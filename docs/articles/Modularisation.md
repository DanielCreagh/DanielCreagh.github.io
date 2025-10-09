# [Modularization: Part 1](https://www.pointfree.co/episodes/ep171-modularization-part-1)
## Different types of modularisation
- model and helper modules - easy but not much gain
- feature modularity - more difficult but higher gains
Features can be as small as you want

## How to add a module in Xcode
- we can add a Framework Target
* hairy
- Cocoapods (other 3rd parties)
* nasty
- SPM
* requires the fewest steps and tooling

## Creating an SPM
`$ swift package init`
drag the root of the package & project into the Xcode project
to avoid the duplicate app folder in the navigator panel
- add a `package.swift` with empty description in the app folder
- reopen the project file
Now we can add files into the module and compile it independently
- don't forget to import the SPM module as a framework into your main app target
- don't forget to make the properties in the modue public too!

Previews should load quicker when it's modularised
