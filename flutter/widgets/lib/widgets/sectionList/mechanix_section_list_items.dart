import 'package:flutter/material.dart';
import 'package:widgets/mechanix.dart';

class MechanixSectionListItems extends StatelessWidget {
  const MechanixSectionListItems({
    super.key,
    this.leading,
    this.trailing,
    required this.title,
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            onTapUp: onTapUp,
            onTapDown: onTapDown,
            onDoubleTap: onDoubleTap,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        if (leading != null) leading!.padRight(),
                        Text(
                          title,
                          style: context.textTheme.labelMedium
                              ?.merge(titleTextStyle),
                        )
                      ],
                    ),
                    if (trailing != null) trailing!,
                  ],
                ).padAll(20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
