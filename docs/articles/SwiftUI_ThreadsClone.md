# [SwiftUI Threads Clone](https://www.youtube.com/watch?v=MfwdchNNW78)
- SwiftUI
- `async await`
- Firebse

## Features
- wall
- user profile
- create thread

## Project Setup
- file organisation is very helpful
* App
* Core
* Extensions
* Models
* Services
* Utilities
I think core should be maybe "features". He also puts authentication in Core, should be in Services if you ask me.

## Authentication
- creating the views for login and register

using environment variable `dismiss` to give access to `dismiss()`

## TabBarView
No surprises

## FeedView
`LazyVStack` lazy loading, only loads those currently on screen. Use `showsIndicators: false` on your `ScrollView` to avoid weird behaviour with the lazy.

Use of `Cell` terminology for the row. I wonder if this is a good, the Cell in UIKit has a whole bunch of extra functionality built in in addition to the `UIView` implementations.

Woah! I never realised that icon was a "paper plane" for the "send" function.

on the `ScrollView` there's a `.refreshable` modifier (?) which seems pretty nifty.

## ExploreView
Essentially refactoring out into individual Views.

nice use of the "embed in `H/VStack`" feature on the right click drop down.

Nice use of enum conforming to `Int` and `Identifiable` to be able to use it in a `ForEach`.

So, we can get the width of the screen using:
```
UIScreen.main.bounds
```
This could be very useful when doing responsive designs!

# New Thread
`.disabled` view modified is neat (should just work on buttons)

# Integrating Firebase
Setup project on FIrebase Dashboard 
- don't bother with analytics
adding the individual packages from firebase

## Authentication (Registration)
- using ViewModel terminology for providing networking services :face_palm:
- creating Services group

### Login 
- Auth service is singleton
- check `Auth.auth().currentUser` to check if currently signed in
- using Combine to listen to when we received a user session back from FireBase `AuthService`
- The main view listens and makes the decision whether to show login or not
- adding sign out function to the singleton auth service
- use the FireBase functions to sign out
- using Combine to navigate the user back to LoginWhen they signout

> Value of using the singleton on AuthService

Creating model for users to upload to firebase
User FirebaseFirestoreSwift to upload model data
user has a `uid` which we can use in the DB

# Uploading Content

# Explore View
```
let snapshot = try away Firestore.firestore("\(document type name)").getDocument()
```
- PreviewProvider -> DeveloperProvider
Using an extension to provide mock data for the previews

# Navigation Stack correct architecture.
- We can't have a view in a navigation stack, navigating to a view in another navigation stack

# Adding Profile Image
- `import PhotosUI`
- `PhotosPicker`
Does this have the capability to load videos?
`PhotoPickerItem` 

# Uploading Image To Firestore
### Image Uploader Service
```
import Firebase
import FirebaseStorage
```
- needs to be a UIImage
- compression quality (on UIImage)2
- returning a string
- create a storage refernce with a path
- putData
- get the url back
- associate the imageURL with a location in the DB
- 