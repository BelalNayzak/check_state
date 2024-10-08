# CheckState

Say goodbye to boilerplate code of state checks that makes the widget tree dirty and say Hi to `check_state`!
`check_state` is a lightweight Flutter package that simplifies managing and displaying different states in your widgets. It allows you to handle loading, error, and success states effortlessly by wrapping your widgets and providing default or custom widgets for error and loader states.

## Features

- **State Management Simplified**: Easily switch between loading, error, and success states.
- **Default Widgets**: Set default error and loader widgets at the start of your app and override them when necessary.
- **Customizable**: Pass custom widgets for specific states as needed.
- **Clean Widget Tree**: No dirty state checks to handle the widgets tree anymore.

## Getting Started

### Installation

Add `check_state` to your `pubspec.yaml` file:

```yaml
dependencies:
  check_state: <latest-version>
```
### Example
In your `main.dart` file, add your default error and loader widgets. for example:
```dart
void main() {
  CheckState.setDefaultWidgets(
    errorWidget: Center(child: Text('Oops! Something went wrong')),
    loaderWidget: Center(child: CircularProgressIndicator()),
  );

  runApp(MyApp());
}
```
Now wrap your widgets with `CheckState` and provide custom widgets for error and loader states.
```dart
import 'package:check_state/check_state.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CheckState(
        isLoading: true,  // Set the current state (e.g., loading)
        successWidget: Center(child: Text('Data Loaded Successfully')),
        // optional:
        // Provide custom error and loader widgets if you don't want to use the default ones you set in main.dart
        // errorWidget: Center(child: Text('Oops! Something went wrong')),
        // loaderWidget: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
```

### Parameters:

| Name | Type | Description |
| --- | --- | --- |
| isError | `bool?` | Whether the widget should display the error state. |
| isLoading | `bool?` | Whether the widget should display the loading state. |
| errWidget | `Widget?` | Widget displayed when an error occurs (optional). |
| successWidget | `Widget?` | Widget displayed on success (required). |
| loaderWidget | `Widget?` | Widget displayed while loading (optional). |

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests on the [GitHub repository](https://github.com/BelalNayzak/check_state).

## License

MIT License

Copyright (c) 2024 BelalNayzak
