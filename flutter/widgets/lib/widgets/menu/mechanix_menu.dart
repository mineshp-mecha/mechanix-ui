import 'package:flutter/material.dart';
import 'mechanix_menu_theme.dart';

/// A reusable dynamic menu (like PopupMenu).
class MechanixMenu extends StatelessWidget {
  const MechanixMenu({
    super.key,
    required this.items,
    this.backgroundColor,
    this.borderRadius,
    this.shadowColor,
    this.onCancel,
  });

  /// Allow any widget (items, dividers, custom widgets)
  final List<Widget> items;
  final Color? backgroundColor;
  final double? borderRadius;
  final Color? shadowColor;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final menuTheme = MechanixMenuTheme.of(context);

    final resolvedBackgroundColor = backgroundColor ??
        menuTheme.backgroundColor?.resolve({}) ??
        theme.colorScheme.surface;

    final resolvedShadowColor =
        shadowColor ?? menuTheme.shadowColor?.resolve({}) ?? Colors.black26;

    final resolvedBorderRadius = BorderRadius.circular(
      borderRadius ?? menuTheme.borderRadius ?? 8,
    );

    return Material(
      color: Colors.transparent,
      child: IntrinsicWidth(
        // auto-fit width to items
        child: Container(
          decoration: BoxDecoration(
            color: resolvedBackgroundColor,
            borderRadius: resolvedBorderRadius,
            boxShadow: [
              BoxShadow(
                color: resolvedShadowColor,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch, // items fill width
            children: items,
          ),
        ),
      ),
    );
  }
}
