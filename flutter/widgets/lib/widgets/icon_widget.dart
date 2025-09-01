import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget(
      {super.key,
      this.boxHeight = 24,
      this.boxWidth = 24,
      this.iconHeight = 18,
      this.iconWidth = 22.5,
      required this.iconPath});

  final double boxHeight;
  final double boxWidth;
  final double iconHeight;
  final double iconWidth;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: boxHeight, width: boxWidth, child: Image.asset(iconPath));
  }
}
