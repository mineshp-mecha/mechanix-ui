import 'package:flutter/material.dart';
import 'mechanix_fab_item_theme.dart';

/// Defines a single FAB item (like an action in a SpeedDial).
class MechanixFabItem {
  final IconData? icon;
  final String? iconPath;
  final String? label;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? iconSize;
  final TextStyle? labelTextStyle;

  final LayerLink? anchorLink;

  const MechanixFabItem({
    required this.icon,
    this.label,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
    this.iconSize,
    this.labelTextStyle,
    this.anchorLink,
  }) : iconPath = null;

  const MechanixFabItem.fromImage({
    required this.iconPath,
    this.label,
    this.onTap,
    this.backgroundColor,
    this.iconColor,
    this.iconSize,
    this.labelTextStyle,
    this.anchorLink,
  }) : icon = null;

  Widget build(BuildContext context) {
    final itemTheme = MechanixFabItemTheme.of(context);

    final resolvedIconColor = iconColor ??
        itemTheme.iconColor?.resolve({}) ??
        Theme.of(context).colorScheme.onSurface;

    final resolvedIconSize = iconSize ?? itemTheme.iconSize ?? 24.0;

    final button = IconButton(
      tooltip: label,
      icon: icon == null && iconPath != null
          ? Image.asset(
              iconPath!,
              height: resolvedIconSize,
              width: resolvedIconSize,
              color: resolvedIconColor,
            )
          : Icon(
              icon,
              color: resolvedIconColor,
              size: resolvedIconSize,
            ),
      onPressed: onTap,
    );

    // If an anchorLink is provided, wrap the button so overlays can follow it.
    return anchorLink != null
        ? CompositedTransformTarget(link: anchorLink!, child: button)
        : button;
  }
}

/// A custom FAB menu with multiple items.
class MechanixFabMenu extends StatelessWidget {
  const MechanixFabMenu({
    super.key,
    required this.items,
    this.mainIcon = Icons.add,
    this.mainBackgroundColor = Colors.blue,
    this.mainIconColor = Colors.white,
  });

  final List<MechanixFabItem> items;
  final IconData mainIcon;
  final Color mainBackgroundColor;
  final Color mainIconColor;

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      mainIcon: mainIcon,
      mainBackgroundColor: mainBackgroundColor,
      mainIconColor: mainIconColor,
      items: items,
    );
  }
}

class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    super.key,
    required this.items,
    required this.mainIcon,
    required this.mainBackgroundColor,
    required this.mainIconColor,
  });

  final List<MechanixFabItem> items;
  final IconData mainIcon;
  final Color mainBackgroundColor;
  final Color mainIconColor;

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final itemTheme = MechanixFabItemTheme.of(context);

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        if (_expanded)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.items.map((item) {
              final resolvedBackground = item.backgroundColor ??
                  itemTheme.backgroundColor?.resolve({}) ??
                  Theme.of(context).primaryColor;

              final resolvedIconColor = item.iconColor ??
                  itemTheme.iconColor?.resolve({}) ??
                  Colors.white;

              final resolvedIconSize =
                  item.iconSize ?? itemTheme.iconSize ?? 24.0;

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: FloatingActionButton.extended(
                  heroTag: null,
                  backgroundColor: resolvedBackground,
                  onPressed: item.onTap,
                  icon: Icon(
                    item.icon,
                    color: resolvedIconColor,
                    size: resolvedIconSize,
                  ),
                  label: Text(
                    item.label ?? '',
                    // style: resolvedLabelStyle,
                  ),
                ),
              );
            }).toList(),
          ),
        FloatingActionButton(
          backgroundColor: widget.mainBackgroundColor,
          onPressed: () {
            setState(() => _expanded = !_expanded);
          },
          child: Icon(
            _expanded ? Icons.close : widget.mainIcon,
            color: widget.mainIconColor,
          ),
        ),
      ],
    );
  }
}
