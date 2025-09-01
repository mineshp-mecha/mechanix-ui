import 'package:flutter/material.dart';

class SectionListItemsType {
  SectionListItemsType({
    required this.title,
    this.leading,
    this.trailing,
    this.subTitle,
    this.titleTextStyle,
    this.subTitleTextStyle,
    this.onTap,
    this.onTapUp,
    this.onTapDown,
    this.onDoubleTap,
  });

  final Widget? leading;
  final Widget? trailing;
  final String title;
  final String? subTitle;
  final TextStyle? titleTextStyle;
  final TextStyle? subTitleTextStyle;
  final GestureTapCallback? onTap;
  final GestureTapUpCallback? onTapUp;
  final GestureTapDownCallback? onTapDown;
  final GestureTapCallback? onDoubleTap;
}
