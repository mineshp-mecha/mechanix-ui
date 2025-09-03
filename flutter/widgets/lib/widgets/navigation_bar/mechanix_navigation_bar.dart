import 'package:flutter/material.dart';
import 'package:widgets/mechanix.dart';

import 'mechanix_navigation_bar_theme.dart';

class MechanixNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String? titleText;
  final Widget? leadingWidget;
  final Widget? backIcon;
  final List<Widget>? actionWidgets;

  final bool? centerTitle;
  final bool? automaticallyImplyLeading;
  final double? leadingWidth;
  final double? height;
  final TextStyle? titleTextStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final IconThemeData? actionsIconTheme;
  final double? titleSpacing;

  const MechanixNavigationBar(
      {super.key,
      this.backIcon,
      this.titleText,
      this.height,
      this.automaticallyImplyLeading,
      this.centerTitle,
      this.titleTextStyle,
      this.leadingWidget,
      this.leadingWidth,
      this.titleSpacing,
      this.elevation,
      this.foregroundColor,
      this.actionsIconTheme,
      this.actionWidgets,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final barTheme = MechanixNavigationBarTheme.of(context);
    final theme = Theme.of(context);
    final resolvedCenterTitle = centerTitle ?? barTheme.centerTitle ?? false;

    final resolvedAutomaticallyImplyLeading =
        automaticallyImplyLeading ?? barTheme.automaticallyImplyLeading;

    final resolvedLeadingWidth = leadingWidth ?? barTheme.leadingWidth ?? 44;

    final resolvedHeight = height ?? barTheme.height ?? kToolbarHeight;

    final resolvedBackgroundColor = backgroundColor ??
        barTheme.backgroundColor ??
        theme.colorScheme.surface;

    final resolvedForegroundColor = foregroundColor ??
        barTheme.foregroundColor ??
        theme.colorScheme.surfaceContainer;

    final resolvedElevation = elevation ?? barTheme.elevation ?? 0;

    final resolvedActionsIconTheme =
        actionsIconTheme ?? barTheme.actionsIconTheme ?? theme.iconTheme;

    final resolvedTitleSpacing = titleSpacing ?? barTheme.titleSpacing ?? 2;

    // Resolve title text style with proper merging
    final defaultTitleStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 18,
    );

    final themedTitleStyle = barTheme.titleTextStyle;

    final resolvedTitleTextStyle =
        defaultTitleStyle.merge(themedTitleStyle).merge(titleTextStyle);

    return AppBar(
      toolbarHeight: resolvedHeight,
      automaticallyImplyLeading: resolvedAutomaticallyImplyLeading,
      backgroundColor: resolvedBackgroundColor,
      leadingWidth: resolvedLeadingWidth,
      centerTitle: resolvedCenterTitle,
      actionsIconTheme: resolvedActionsIconTheme,
      titleSpacing: resolvedTitleSpacing,
      foregroundColor: resolvedForegroundColor,
      leading: leadingWidget ??
          (resolvedAutomaticallyImplyLeading && Navigator.canPop(context)
              ? IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: SizedBox(
                      height: 16,
                      width: 8,
                      child: backIcon ??
                          Image.asset(
                            MechanixIcons.backButton,
                            package: 'widgets',
                          )),
                )
              : null),
      elevation: resolvedElevation,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (titleText != null)
            Text(
              titleText ?? '',
              style: resolvedTitleTextStyle,
            )
        ],
      ),
      actionsPadding: Spacing.symmetric(h: 2, v: 5),
      actions: actionWidgets,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 50.0);
}
