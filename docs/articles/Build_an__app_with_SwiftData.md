# [Build an app with SwiftData](https://developer.apple.com/videos/play/wwdc2023/10154/)
Important to watch [Meet Swift Data](https://developer.apple.com/videos/play/wwdc2023/10187) first.

SwiftData to replace CoreData & Realm.

- Cross Platform (TV, Watch, iOS, MacOS)
- Code-a-long

## `@Model`
- Annotation on your class? (Can be `struct`)
- gets automatic `Observable` conformance
- ensure to make sure the object is @Bindable

### Recommended to watch:
[Discover Observation in SwiftUI](https://developer.apple.com/videos/play/wwdc2023/10149)

replace `@State` with `@Query`
Provides the view with data
Triggers view update on every change of the models
A view can have multiple @Query properties
Uses ModelContext as the source of data

## Model Container
there must be at least 1 `.modelContainer`

### SwiftUI
the child views will inherit the container

we can use `@Environment(\.modelContext) var modelContext` directly in the SwiftUI Views
- at this point it might be worth discussing if it's applicable in UIKit.
We don't have to "save" context each time we update (it autosaves)
However, we can call `.save` explcitly

## Document Based Apps
SwiftUI supports SwiftData Document based apps.
We can use DocumentGroup (never seen this before)
We can create new content types


### Feedback:
an old colleague tried to use SwiftData on a project and had this feedback:
```
SwiftData Notes:
- Sync Issues
- iCloud Syncing On/Off is not working; it always syncs.
- Tracking syncing status is not possible.
- When the app is re-installed, iCloud Syncing could start with any data. For example, if you have a structure like ParentModel > ChildModel > AnotherChildModel, it could start from AnotherChildModel or ChildModel. I couldn't see it actually start from ParentModel, but maybe it just didn't happen to me.
- Model Issues
- Enums should conform to string to be able to add new values without migration.
- Migration looks easy, but it is not. (Impossible to debug or I couldn't do it)
- Sometimes in rare cases, you may need to use .modelContainer() duplicated in NavigationView to make it work with macOS (Designed for iPad). Binding from the top level on iOS and iPadOS has no issue. I guess there is a bug on macOS, it just won’t pass environmental variables on some cases, this happened to me with other environment objects too.
- If you need to initialize the ModelContainer conditionally, you need to create a new StateObject with ObservableObject to avoid multiple initializations.
- Insert related models into the database before appending or using them under another model with modelContext.insert(MyModel).
- When you update your models, clean the build folders and reset the iCloud environment while developing, it will be easier than the migration. (The initial development only)
- Optimization
- Add UpdatedAt Field to your models to optimize SwiftUI render cycles (sometimes you need to calculate or perform heavy operations with the data, so you may want to store that in the state, but also you will need to update it when something changes. To do that easily, always check updatedAt.) We are doing it because even if the model conforms to hashable, it does not always track changes properly, especially with related models.
```
- how are the error messages? CoreData error messages were cryptic, not user-friendly

How does the implementation of accessibility differ on SwiftUI compares to UIKit?