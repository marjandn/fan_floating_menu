import 'package:flutter/material.dart';

import '../../fan_floating_menu.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    super.key,
    required double menuItemHeigh,
    required AnimationController textAnimationController,
    required FanMenuItem fanMenuItem,
    required int index,
    required Curve expandItemsCurve,
    required FanMenuDirection fanMenuDirection,
  })  : _menuItemHeigh = menuItemHeigh,
        _textAnimationController = textAnimationController,
        _fanMenuItem = fanMenuItem,
        _index = index,
        _expandItemsCurve = expandItemsCurve,
        _fanMenuDirection = fanMenuDirection;

  final double _menuItemHeigh;
  final AnimationController _textAnimationController;
  final FanMenuItem _fanMenuItem;
  final int _index;
  final Curve _expandItemsCurve;
  final FanMenuDirection _fanMenuDirection;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: (_fanMenuDirection == FanMenuDirection.rtl)
          ? Alignment.bottomRight
          : Alignment.bottomLeft,
      child: SizedBox(
        height: _menuItemHeigh,
        child: Padding(
          padding: EdgeInsets.only(
              left: (_fanMenuDirection == FanMenuDirection.rtl) ? 0 : 11,
              right: (_fanMenuDirection == FanMenuDirection.rtl) ? 11 : 0,
              bottom: 10),
          child: Directionality(
            textDirection:
                (_fanMenuDirection == FanMenuDirection.rtl) ? TextDirection.rtl : TextDirection.ltr,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => _fanMenuItem.onTap(),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(60),
                  ),
                  child: _fanMenuItem.itemWidget ??
                      Ink(
                        decoration: BoxDecoration(
                            color: _fanMenuItem.menuItemColor,
                            boxShadow: _fanMenuItem.menuItemBoxShadow,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(80),
                            )),
                        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                          SizeTransition(
                            sizeFactor: _textAnimationController,
                            axis: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 13),
                              child: Row(
                                children: [
                                  Icon(
                                    _fanMenuItem.icon,
                                    color: _fanMenuItem.menuItemIconColor,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          _fanMenuItem.title,
                                          textAlign: TextAlign.left,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: _fanMenuItem.titleStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Interval _menuItemAnimationInterval() => Interval(
        (_index * 0.3),
        ((_index * 0.3) + 0.100),
        curve: _expandItemsCurve,
      );
}
