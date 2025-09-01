import 'package:flutter/material.dart';

class SectionListType {
  SectionListType(
      {this.title,
      required this.sectionListItems,
      this.backGroundColor,
      this.titleTextStyle,
      this.dividerThickness,
      this.dividerHeight,
      this.dividerColor,
      this.divider,
      this.isDividerRequired = false});

  final String? title;

  final Color? backGroundColor;

  final TextStyle? titleTextStyle;

  final TextStyle? dividerThickness;

  final TextStyle? dividerHeight;

  final TextStyle? dividerColor;

  final bool isDividerRequired;

  final Widget? divider;

  final List<SectionListItemsType> sectionListItems;
}

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
