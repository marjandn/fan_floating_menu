A customizable floating action button menu that will pop up fabs with special animation.

<image src="https://github.com/user-attachments/assets/9512289a-2256-4f7e-aba3-9d72a366d522" width=300>
 

## Installation

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  flutter:
    sdk:
  fan_floating_menu: any
```

Import the fantasy menu package like this:

```dart
  import 'package:fan_floating_menu/fan_floating_menu.dart';
```

## Usage

Simply create a FanFloatingMenu widget, and pass the required params:

```dart
  FanFloatingMenu(
        menuItems: [
          FanMenuItem(onTap: () {}, icon: Icons.edit_rounded, title: 'Edit Texts'),
          FanMenuItem(onTap: () {}, icon: Icons.save_rounded, title: 'Save Notes'),
          FanMenuItem(onTap: () {}, icon: Icons.send_rounded, title: 'Send Images'),
        ],
      ),
```

## Customization

Customize the FanFloatingMenu widget with these parameters:

```dart

  /// Defines the direction of the whole Floating Menu.
  /// Defaults to [FanMenuDirection.ltr]
  final FanMenuDirection fanMenuDirection;

  /// Defines menu items, that are of [FanMenuItem] type.
  final List<FanMenuItem> menuItems;

  /// Defines the [Curve] for use in all animations related to.
  /// Defaults to [Curves.easeInOutBack]
  final Curve expandItemsCurve;

  /// Defines any widget for the toggle button widget.
  /// If null then a plus icon will be shown.
  final Widget? toggleButtonWidget;

  /// Defines the color for the toggle button icon.
  /// Defaults to [Colors.white]
  final Color toggleButtonIconColor;

  /// Defines the color for the toggle button background.
  /// Defaults to [Colors.pink]
  final Color toggleButtonColor; 

  /// Defines the shape of floating button
  /// Defaults to [CircleBorder()]
  final ShapeBorder buttonShape;

  /// Defines the size of floating button
  /// Defaults to [50]
  final double buttonSize;

```
