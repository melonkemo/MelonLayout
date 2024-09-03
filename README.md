# MelonLayout
Melon layout widget

## Initialize
#### main.dart
 ```dart
MelonLayout.instance.init(desktop: <value>, tablet: <value>);
 ```

## Usage
#### Layout State
 ```dart
MelonLayout.state<type>(context,mobile: <value>, tablet: <value>, desktop: <value>)
 ```

#### BuildContext Size
 ```dart
context.layout.<width || height>
 ```

#### Current Layout
 ```dart
MelonLayout.instance.getCurrentLayout(context)
 ```