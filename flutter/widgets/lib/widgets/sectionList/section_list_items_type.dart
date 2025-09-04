import 'package:flutter/material.dart';

class SectionListItems {
  SectionListItems(
      {required this.title,
      this.leading,
      this.trailing,
      this.titleTextStyle,
      this.onTap,
      this.onTapUp,
      this.onTapDown,
      this.onDoubleTap,
      this.defaultTrailing = true,
      this.backgroundColor});

  final Widget? leading;
  final Widget? trailing;
  final bool defaultTrailing;
  final String title;
  final TextStyle? titleTextStyle;
  final GestureTapCallback? onTap;
  final GestureTapUpCallback? onTapUp;
  final GestureTapDownCallback? onTapDown;
  final GestureTapCallback? onDoubleTap;
  final Color? backgroundColor;
}
