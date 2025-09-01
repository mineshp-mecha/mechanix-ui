import 'package:flutter/material.dart';
import 'package:widgets/mechanix.dart';
import 'package:widgets/widgets/listItems/mechanix_list_items_theme.dart';

class MechanixListItems extends StatelessWidget {
  const MechanixListItems({
    super.key,
    this.leading,
    this.trailing,
    required this.title,
    this.subTitle,
    this.onTap,
    this.onTapUp,
    this.onTapDown,
    this.onDoubleTap,
  });

  final Widget? leading;

  final Widget? trailing;

  final String title;

  final String? subTitle;

  final GestureTapCallback? onTap;

  final GestureTapUpCallback? onTapUp;

  final GestureTapDownCallback? onTapDown;

  final GestureTapCallback? onDoubleTap;

  @override
  Widget build(BuildContext context) {
    final itemTheme = MechanixListItemTheme.of(context);

    return Material(
      color: itemTheme.backgroundColor ?? Colors.transparent,
      child: InkWell(
        onTap: () {},
        onTapUp: onTapUp,
        onTapDown: onTapDown,
        onDoubleTap: onDoubleTap,
        splashColor: itemTheme.splashColor?.resolve({}),
        child: Padding(
          padding: itemTheme.padding ?? Spacing.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (leading != null) leading!.padRight(),
                  Text(
                    title,
                    style: context.textTheme.labelMedium
                        ?.merge(itemTheme.titleTextStyle),
                  )
                ],
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }
}
