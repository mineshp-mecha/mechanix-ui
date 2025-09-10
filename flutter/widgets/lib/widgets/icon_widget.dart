import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    this.boxHeight = 24,
    this.boxWidth = 24,
    this.iconHeight = 24,
    this.iconWidth = 24,
    this.iconColor = const Color(0xFF989898),
    this.activeIconColor = const Color(0xFF2D8AFF),
    this.isActive = false,
    required this.iconPath,
  })  : icon = null,
        package = null;

  const IconWidget.fromMechanix({
    super.key,
    this.boxHeight = 24,
    this.boxWidth = 24,
    this.iconHeight = 24,
    this.iconWidth = 24,
    this.iconColor = const Color(0xFF989898),
    this.activeIconColor = const Color(0xFF2D8AFF),
    this.isActive = false,
    this.package = 'widgets',
    required this.iconPath,
  }) : icon = null;

  const IconWidget.fromIconData({
    super.key,
    this.boxHeight = 24,
    this.boxWidth = 24,
    this.iconHeight = 24,
    this.iconWidth = 24,
    this.iconColor = const Color(0xFF989898),
    this.activeIconColor = const Color(0xFF2D8AFF),
    this.isActive = false,
    required this.icon,
  })  : iconPath = '',
        package = null;

  final double boxHeight;
  final double boxWidth;
  final double iconHeight;
  final double iconWidth;
  final String iconPath;
  final Color iconColor;
  final bool isActive;
  final Icon? icon;
  final String? package;
  final Color activeIconColor;

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return SizedBox(
        height: boxHeight,
        width: boxWidth,
        child: FittedBox(
          fit: BoxFit.none,
          child: SizedBox(
            height: iconHeight,
            width: iconWidth,
            child: icon,
          ),
        ),
      );
    }

    return SizedBox(
      height: boxHeight,
      width: boxWidth,
      child: FittedBox(
        fit: BoxFit.none,
        child: SizedBox(
          height: iconHeight,
          width: iconWidth,
          child: package != null
              ? Image.asset(
                  iconPath,
                  color: isActive ? activeIconColor : iconColor,
                  package: package,
                )
              : Image.asset(
                  iconPath,
                  color: isActive ? activeIconColor : iconColor,
                ),
        ),
      ),
    );
  }
}
