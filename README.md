# MelonLayout
Melon layout widget

## Setup
#### main.dart
 ```dart
MelonLayout.instance.setup(desktop: <value>, tablet: <value>);
 ```

## Usage
#### Layout
###### Flex State (Normal)
 ```dart
MelonLayout.flex<type>(context,mobile: <value>, tablet: <value>, desktop: <value>)
 ```

###### Flex State (BuildContext)
 ```dart
context.flex<type>(mobile: <value>, tablet: <value>, desktop: <value>)
 ```

###### Current Layout
 ```dart
MelonLayout.instance.getCurrentLayout(context)
 ```

#### Dimensions
###### Setup
 ```dart
dimension: <value>
mobileDimension: <value>
webDimension: <value>
desktopDimension: <value>
 ```
###### Fully
 ```dart
MelonLayout.instance.dt(<value>)
 ```
###### BuildContext
 ```dart
context.dt(<value>)
 ```
###### Integer or Double
 ```dart
<value>.dt
 ```

#### Scaffold
###### Basic
 ```dart
MelonLayoutScaffold(
  body: <value>
)
 ```
###### Advanced
 ```dart
statusBarColor: <value> // Colors.white
systemNavigationBarColor: <value> // Colors.transparent
statusBarIconBrightness: <value> // Brightness.dark
systemNavigationBarIconBrightness: <value> // Brightness.dark

appBar: <value>
extendBodyBehindAppBar: <value> // false

backgroundColor: <value>
children: [<value>]
 ```
#### Utilities
###### BuildContext Size
 ```dart
context.layout.<width || height>
 ```
