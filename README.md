A customizable floating action button menu that will pop up fabs with special animation.

<image src="https://user-images.githubusercontent.com/25709266/235315772-038c934d-1b3a-4002-96db-b80f36cc7944.gif" width=300>

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
  final FanMenuDirection fanMenuDirection;

  /// Defines menu items, that are of [FanMenuItem] type.
  final List<FanMenuItem> menuItems;

  /// Defines the [Curve] for use in all animations related to.
  final Curve expandItemsCurve;

  /// Defines any widget for the toggle button widget.
  /// If null then a plus icon will be shown.
  final Widget? toggleButtonWidget;

  /// Defines the color for the toggle button icon.
  final Color toggleButtonIconColor;

  /// Defines the color for the toggle button background.
  final Color toggleButtonColor;

```
