import 'dart:math';
import 'package:fan_floating_menu/fan_floating_menu.dart';
import 'package:flutter/material.dart';
import 'widgets/menu_item_widget.dart';

class FanFloatingMenu extends StatefulWidget {
  FanFloatingMenu({
    super.key,
    required this.menuItems,
    this.fanMenuDirection = FanMenuDirection.ltr,
    this.expandItemsCurve = Curves.easeInOutBack,
    this.toggleButtonColor = Colors.pink,
    this.toggleButtonIconColor = Colors.white,
    this.toggleButtonWidget,
  }) : assert(menuItems.isNotEmpty && menuItems.length < 5);

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

  @override
  State<FanFloatingMenu> createState() => _FanFloatingMenu();
}

class _FanFloatingMenu extends State<FanFloatingMenu> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _textAnimationController;
  late Animation<double> _floatingButtonsAnimation;

  final double toggleButtonSize = 75;
  double get _menuItemHeigh => (toggleButtonSize - 15);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _textAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
        reverseDuration: const Duration(milliseconds: 400));

    _floatingButtonsAnimation =
        CurvedAnimation(parent: _animationController, curve: widget.expandItemsCurve)
          ..addStatusListener((status) {
            _startMenuItemsAnimation(status);
          });
  }

  void _startMenuItemsAnimation(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _textAnimationController.forward();
    } else if (status == AnimationStatus.reverse) {
      _textAnimationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _textAnimationController.dispose();
    _floatingButtonsAnimation.removeStatusListener((status) {
      _startMenuItemsAnimation(status);
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Flow(
          delegate: _MyFloatingDelegate(
            _floatingButtonsAnimation,
            toggleButtonSize,
            _menuItemHeigh,
          ),
          children: _menuItemWidgets(),
        ),
        Align(
          alignment: (widget.fanMenuDirection == FanMenuDirection.rtl)
              ? Alignment.bottomRight
              : Alignment.bottomLeft,
          child: SizedBox.square(
            dimension: toggleButtonSize,
            child: FloatingActionButton(
              onPressed: () {
                _toggleMenu();
              },
              backgroundColor: widget.toggleButtonColor,
              child: RotationTransition(
                turns: Tween<double>(begin: 0, end: (pi * .04)).animate(_animationController),
                child: widget.toggleButtonWidget ??
                    Icon(
                      Icons.add_rounded,
                      color: widget.toggleButtonIconColor,
                      size: 45,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _toggleMenu() {
    if (!_animationController.isCompleted) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  List<Widget> _menuItemWidgets() => widget.menuItems
      .asMap()
      .entries
      .map((e) => MenuItemWidget(
            fanMenuDirection: widget.fanMenuDirection,
            menuItemHeigh: _menuItemHeigh,
            textAnimationController: _textAnimationController,
            fanMenuItem: e.value,
            index: e.key,
            expandItemsCurve: widget.expandItemsCurve,
          ))
      .toList();
}

class _MyFloatingDelegate extends FlowDelegate {
  final Animation<double> _animation;
  final double _toggleItemHeight;
  final double _menuItemHeigh;

  _MyFloatingDelegate(
    this._animation,
    this._toggleItemHeight,
    this._menuItemHeigh,
  ) : super(repaint: _animation);

  @override
  void paintChildren(FlowPaintingContext context) {
    double dy = 0;
    for (int i = 0; i < context.childCount; i++) {
      dy = ((_menuItemHeigh) * (-i)) - _toggleItemHeight;
      context.paintChild(i, transform: Matrix4.translationValues(0, dy * _animation.value, 0));
    }
  }

  @override
  bool shouldRepaint(covariant _MyFloatingDelegate oldDelegate) {
    return _animation != oldDelegate._animation;
  }
}
