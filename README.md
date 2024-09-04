# MelonLayout
Melon layout widget

## Setup
#### main.dart
 ```dart
MelonLayout.instance.setup(desktop: <value>, tablet: <value>);
 ```

## Usage
#### Layout Flex State (Normal)
 ```dart
MelonLayout.flex<type>(context,mobile: <value>, tablet: <value>, desktop: <value>)
 ```

#### Layout Flex State (BuildContext)
 ```dart
context.flex<type>(mobile: <value>, tablet: <value>, desktop: <value>)
 ```

#### BuildContext Size
 ```dart
context.layout.<width || height>
 ```

#### Current Layout
 ```dart
MelonLayout.instance.getCurrentLayout(context)
 ```

## Dimensions
#### Fully
 ```dart
MelonLayout.instance.dt(<value>)
 ```
#### BuildContext
 ```dart
context.dt(<value>)
 ```
#### Integer
 ```dart
10.dt
 ```
#### Double
 ```dart
10.0.dt
 ```