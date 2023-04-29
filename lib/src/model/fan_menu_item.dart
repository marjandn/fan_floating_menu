import 'package:flutter/material.dart';

class FanMenuItem {
  /// Defines a widget for the item.
  /// If define [itemWidget] property then other property will not apply for menu items.
  final Widget? itemWidget;

  /// Defines an icon for an item
  /// If define the [icon] property then [itemWidget] property will not apply.
  final IconData? icon;

  /// Defines title of the item.
  final String title;

  /// Defines [TextStyle] for the item.
  final TextStyle titleStyle;

  /// Defines item background color.
  final Color menuItemColor;

  /// Defines the icon color of the item.
  final Color menuItemIconColor;

  /// Defines the [BoxShadow] list for the item.
  final List<BoxShadow> menuItemBoxShadow;

  /// Defines a callback for when user tapps on the item.
  final void Function() onTap;

  const FanMenuItem({
    required this.onTap,
    this.itemWidget,
    this.icon,
    this.title = '',
    this.menuItemIconColor = Colors.pink,
    this.titleStyle = const TextStyle(fontSize: 16, color: Colors.black),
    this.menuItemBoxShadow = const [
      BoxShadow(color: Colors.grey, offset: Offset(0, 0), blurRadius: 2)
    ],
    this.menuItemColor = Colors.white,
  }) : assert(itemWidget != null || icon != null);
}
