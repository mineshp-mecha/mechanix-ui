import 'package:flutter/material.dart';
import 'package:widgets/mechanix.dart';
import 'package:widgets/widgets/pressable_list/mechanix_pressable_list_theme.dart';

class MechanixPressableList extends StatelessWidget {
  final GestureTapCallback? onLongPress;
  final GestureTapCallback? onTap;
  final bool selectionMode;
  final bool isSelected;
  final Widget? leadingIcon;
  final Widget? trailingWidget;
  final String title;
  final TextStyle? titleTextStyle;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? itemPadding;
  final EdgeInsetsGeometry? leadingIconPadding;
  final EdgeInsetsGeometry? trailingPadding;
  final EdgeInsetsGeometry? checkboxSpacing;
  final Color? checkboxColor;
  final ValueChanged<bool?>? onCheckboxClick;
  final MouseCursor? mouseCursor;
  final BorderRadius? borderRadius;

  const MechanixPressableList(
      {super.key,
      this.onLongPress,
      this.onTap,
      this.selectionMode = false,
      this.isSelected = false,
      this.title = '',
      this.titleTextStyle,
      this.leadingIcon,
      this.backgroundColor,
      this.itemPadding,
      this.leadingIconPadding,
      this.checkboxSpacing,
      this.checkboxColor,
      this.onCheckboxClick,
      this.trailingWidget,
      this.mouseCursor,
      this.trailingPadding,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    final barTheme = MechanixPressableListTheme.of(context);

    final resolvedTitleTextStyle = titleTextStyle ??
        barTheme.titleTextStyle ??
        context.textTheme.bodyLarge;
    final resolvedBackgroundColor =
        backgroundColor ?? barTheme.backgroundColor ?? Color(0xFF2B2B2B);
    final resolvedItemPadding =
        itemPadding ?? barTheme.itemPadding ?? EdgeInsets.all(10);
    final resolvedLeadingIconPadding =
        leadingIconPadding ?? barTheme.leadingIconPadding ?? EdgeInsets.all(10);
    final resolvedcheckboxSpacing = checkboxSpacing ??
        barTheme.checkboxSpacing ??
        EdgeInsets.only(right: 10, left: 5);
    final resolvedCheckboxColor =
        checkboxColor ?? barTheme.checkboxColor ?? Color(0xFF3176FF);
    final resolvedMouseCursor =
        mouseCursor ?? barTheme.mouseCursor ?? SystemMouseCursors.click;
    final resolvedTrailingPadding =
        trailingPadding ?? barTheme.trailingPadding ?? EdgeInsets.all(10);
    final resolvedBorderRadius =
        borderRadius ?? barTheme.borderRadius ?? CircularRadius.sm;

    return Material(
      borderRadius: resolvedBorderRadius,
      color: resolvedBackgroundColor,
      child: MouseRegion(
          cursor: resolvedMouseCursor,
          child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onLongPress: onLongPress,
              onTap: onTap,
              child: Container(
                padding: resolvedItemPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        if (selectionMode)
                          Container(
                              padding: resolvedcheckboxSpacing,
                              child: MechanixCircleCheckbox(
                                value: isSelected,
                                onChanged: onCheckboxClick,
                                activeColor: resolvedCheckboxColor,
                                autofocus: false,
                                tristate: false,
                                width: 20,
                              )),
                        if (leadingIcon != null)
                          Container(
                            padding: resolvedLeadingIconPadding,
                            child: leadingIcon,
                          ),
                        if (title.isNotEmpty)
                          Text(
                            title,
                            style: resolvedTitleTextStyle,
                          ),
                      ],
                    ),
                    if (trailingWidget != null)
                      Container(
                        padding: resolvedTrailingPadding,
                        child: trailingWidget,
                      )
                  ],
                ),
              ))),
    );
  }
}
