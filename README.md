# MelonLayout
Melon layout widget

## Setup
#### main.dart
 ```dart
MelonLayout.instance.setup(desktop: <value>, tablet: <value>);
 ```

## Usage
### Layout
#### Flex State (Normal)
 ```dart
MelonLayout.flex<type>(context,mobile: <value>, tablet: <value>, desktop: <value>)
 ```

#### Flex State (BuildContext)
 ```dart
context.flex<type>(mobile: <value>, tablet: <value>, desktop: <value>)
 ```

#### Current Layout
 ```dart
MelonLayout.instance.getCurrentLayout(context)
 ```

### Dimensions
#### Setup
 ```dart
 dimension: <value>
mobileDimension: <value>
webDimension: <value>
desktopDimension: <value>
 ```
#### Fully
 ```dart
MelonLayout.instance.dt(<value>)
 ```
#### BuildContext
 ```dart
context.dt(<value>)
 ```
#### Integer or Double
 ```dart
<value>.dt
 ```

### Utilities
#### BuildContext Size
 ```dart
context.layout.<width || height>
 ```