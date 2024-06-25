# [Dive deeper into SwiftData](https://developer.apple.com/videos/play/wwdc2023/10196/)

## Configuring Persistence
- `@model` macro
notice he makes his class "final".
- Describe the Schema
schema is applied to the model container
model context tracks instances of the model objects
provide the ModelCOntainer with the type you want to work with

### `ModelConfiguration`
- describes how and where your model is stored

You can use separate schemas with separate modelconfigurations
you can then use separate configurations in the same contiainer

## Track and persist changes
- in SwiftUI we can grab the model context from the environment
- context is like staging for the SwiftData
- you can call save on the context
- it has handy functions like undo
- `undoManager` (have 3 finger swipe and shake for free!)
- autosave is enabled by default

## Modeling at scale
- Fetch Method on `modelContext`
- `PredicateMacro` for complex queries
- immediately type safe once fetched
- enumerate on your context with fetchdescriptor
- we can customise the batchSize on enumerate

# [Model your schema with SwiftData](https://developer.apple.com/videos/play/wwdc2023/10195/)

Like SwiftUI it relies totally on code and macros with no external file types

## Utilizing schema macros
### Upsert
- `@Attribute(.unique)` 

renaming properties will create new properties
we can use - `@Attribute(originalName: "original_name" )` to migrate
- `@Relationship` macros like `cascade` can define ehaviour on the models' property relationships

- `@Transient` - stuff that isn't saved (needs default value)

## Evolving schemas
- define a versioned schema `VersionSchema`
- Order your versions `SchemeMigrationPlan`
* stages of migration plan
