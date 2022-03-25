# Todo App ✅

//image

## Instructions

### 💡Hint:

The [Checkbox](https://api.flutter.dev/flutter/material/Checkbox-class.html) widget.

1. Create a new project called: `todo_app`.
2. Create the structure of your folders: `models`, `widgets`, `pages` and `providers`.
3. Let's start by defining our model, in your `models` folder create a `todo.dart` and create a model with the following properties:

```
int id;
String title;
bool done; // defaults to false
```

4. Generate a constructor for your `Todo` model.
5. Next, let's create our pages as empty pages for now, in your `pages` folder, create a `home_page.dart` with a `Scaffold` and an `AppBar`.
6. Do the same for the `add_page.dart`.
7. Install the `go_router` package and initialize your routes in `main.dart`.

```shell
flutter pub add go_router
```

8. Let's create our provider with the needed logic in it, install the `provider` package.

```shell
flutter pub add provider
```

9. In your `provider` folder, create a file named `todo_provider.dart`.
10. In your `todo_provider.dart` import the material package and your `Todo` model.
11. Create your provider that extends `ChangeNotifier`.
12. Create you `todos` list and initilaize it with one `Todo` object to help us with testing our code.

```dart
  var todos = [
    Todo(id: 1, title: "first todo"),
  ];
```

13. It's time to use our provider, in your `main.dart` import the `provider` package.

```dart
import 'package:provider/provider.dart';
```

14. In your `runApp` function, replace the content with `ChangeNotifierProvider` widget with a create property that takes the `context` as an argument and returns our `TodoProvider`, and a `child` that takes our `MyApp()`.
15. In your `widgets` folder, create a `todo_tile.dart` file.
16. Inside this file, create a `Card` widget with a child that is a `ListTile` widget that displays the title of our `todo` and a `Checkbox` widget.
17. `TodoTile` widget should expect a `Todo` object to be passed, generate a constructor for that.
18. In your `home_page.dart` `Scaffold` `body`, add a `SingleChildScrollView` widget.
19. Import the `provider` package and our `TodoProvider` in `home_page.dart`.
20. In your `SingleChildScrollView`. as child, add a `Consumer` widget that consumes our `TodoProvider`.
21. This consumer widget, will take a builder property that takes three arguments, `context`, ourProvider, and a `child` and returns a widget.
22. That widget should be a `ListView.builder` widget that returns a `TodoTile` and passing the `todo` object from our provider using the `index`.
23. Save your code, and test your app, you should see the `todo` we added in the provider.
24. Now in the same page, in your `AppBar` widget, add the `actions` property that takes a list of widgets.
25. Inside this list, add an `IconButton` widget that takes you to the `add_page` `/add` using the `go_router` `push` method.
26. Setup your `add_page.dart` to have a `Scaffold`, an `AppBar`, `body`, `Column` with a `TextField` and a `ElevatedButton`.
27. Back to our `todo_provider.dart`, let's create a method `addTodo` for adding a `todo`, this method will take a `String` `title` argument, and will generate an `id` for our `todo`, then we will insert this new to do to our `todos` list.
28. Don't forget to call `notifyListeners()`.
29. Back to our `add_page.dart` button `onPressed` method, call our provider `addTodo` method, and pass it the the value of our `TextField` controller.
30. Don't forget to set `listen` to `false` since we are not rebuilding this widget.
31. Now we need to go back to our `home_page`, so use the `pop` method. Check you app to make sure todos are being added.
32. The last thing to do is to change the `done` status of our todo using the `Checkbox` widget.
33. First, we need to create a method for that in our `todo_provider.dart`, this method takes an `id` as an argument, and looks for the `todo` with the same `id` within our `todos` list, and switch it's `done` property value to `true` or `false`.
34. Don't forget to call `notifyListeners()`.
35. Then, we will wrap our `Checkbox` widget with a `Consumer` widget, and within our `onChange` property, we'll call our provider and the method we just created and pass the `id` to it.
