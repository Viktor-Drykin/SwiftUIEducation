# This repo is used for SwiftUI studying. Each file is an example of different SwiftUI elements usage

## Useful macros:
```
@State - to track user interactions with UI
@Published(+ ObservableObject) - to track the changes of vars (they should be @Published) and container should conform ObservableObject protocol
@ObservedObject - should be the object which contains Published views
@StateObject is the same as @ObservedObject, but @StateObject does not reload view if you init object in View
@EnvironmentObject - if you don't want to pass entities through all views, you can save it in environment and get it using this property wrapper
@Binding - connect passed variable in the views
```
