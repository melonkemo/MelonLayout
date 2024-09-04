
# MelonLayout

The `MelonLayout` widget is a flexible and responsive layout manager for Flutter applications, allowing you to design layouts that adapt to different screen sizes seamlessly.

## Setup

To set up `MelonLayout`, include the following in your `main.dart` file:

```dart
MelonLayout.instance.setup(desktop: <value>, tablet: <value>);
```

> **Note**: The `desktop` parameter is required for proper setup.

## Usage

### Layout

#### Flex State (Normal)

Create a flexible layout that adapts to the screen size:

```dart
MelonLayout.flex<type>(context, mobile: <value>, tablet: <value>, desktop: <value>)
```

#### Flex State (BuildContext)

You can also access the flex state directly from the `BuildContext`:

```dart
context.flex<type>(mobile: <value>, tablet: <value>, desktop: <value>)
```

#### Current Layout

To retrieve the current layout type based on the screen size:

```dart
MelonLayout.instance.getCurrentLayout(context)
```

### Dimensions

#### Setup

Define dimensions for different device types:

```dart
dimension: <value>
mobileDimension: <value>
webDimension: <value>
desktopDimension: <value>
```

#### Fully

Use `MelonLayout` to manage dimensions globally:

```dart
MelonLayout.instance.dt(<value>)
```

#### BuildContext

You can also access dimensions directly from the `BuildContext`:

```dart
context.dt(<value>)
```

#### Integer or Double

For easy dimension management, append `.dt` to any integer or double value:

```dart
<value>.dt
```

### Scaffold

#### Basic

A simple scaffold setup:

```dart
MelonLayoutScaffold(
  body: <value>
)
```

#### Advanced

Customize the scaffold with additional properties:

```dart
MelonLayoutScaffold(
  statusBarColor: <value>, // Colors.white
  systemNavigationBarColor: <value>, // Colors.transparent
  statusBarIconBrightness: <value>, // Brightness.dark
  systemNavigationBarIconBrightness: <value>, // Brightness.dark
  appBar: <value>,
  extendBodyBehindAppBar: <value>, // false
  backgroundColor: <value>,
  children: [<value>]
)
```

### Utilities

#### BuildContext Size

Retrieve the width or height directly from the `BuildContext`:

```dart
context.layout.<width || height>
```
