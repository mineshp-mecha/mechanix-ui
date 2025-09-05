import 'package:flutter/material.dart';
import 'mechanix_menu_item_theme.dart';

enum MenuItemLayout {
  iconLeft,
  iconRight,
  bothSides,
  checkLeft,
  checkRight,
}

class MechanixMenuItem extends StatefulWidget {
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final String label;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final MenuItemLayout layout;

  final bool? checkValue;
  final ValueChanged<bool>? onCheckChanged;

  const MechanixMenuItem({
    super.key,
    required this.label,
    this.onTap,
    this.leadingWidget,
    this.trailingWidget,
    this.textStyle,
    this.layout = MenuItemLayout.iconLeft,
    this.checkValue,
    this.onCheckChanged,
  });

  @override
  State<MechanixMenuItem> createState() => _MechanixMenuItemState();
}

class _MechanixMenuItemState extends State<MechanixMenuItem> {
  late bool _checked;

  @override
  void initState() {
    super.initState();
    _checked = widget.checkValue ?? false;
  }

  void _toggleCheck() {
    setState(() => _checked = !_checked);
    widget.onCheckChanged?.call(_checked);
  }

  @override
  Widget build(BuildContext context) {
    final theme = MechanixMenuItemTheme.of(context);

    final resolvedTextStyle = widget.textStyle ??
        theme.textStyle ??
        Theme.of(context).textTheme.bodyMedium;

    final resolvedIconColor =
        theme.iconColor?.resolve({}) ?? Theme.of(context).colorScheme.onSurface;

    final resolvedCheckColor = Theme.of(context).colorScheme.primary;
    //     theme.checkColor?.resolve({}) ?? Theme.of(context).colorScheme.primary;

    final labelWidget = Text(widget.label, style: resolvedTextStyle);

    // Replace Checkbox with custom icons for themed look
    final checkWidget = Icon(
      _checked ? Icons.radio_button_checked : Icons.radio_button_unchecked,
      size: 20,
      color: resolvedCheckColor,
    );

    List<Widget> children;

    switch (widget.layout) {
      case MenuItemLayout.iconLeft:
        children = [
          if (widget.leadingWidget != null)
            IconTheme(
              data: IconThemeData(color: resolvedIconColor, size: 20),
              child: widget.leadingWidget!,
            ),
          if (widget.leadingWidget != null) const SizedBox(width: 12),
          Expanded(child: labelWidget),
        ];
        break;

      case MenuItemLayout.iconRight:
        children = [
          Expanded(child: labelWidget),
          if (widget.trailingWidget != null) ...[
            const SizedBox(width: 12),
            IconTheme(
              data: IconThemeData(color: resolvedIconColor, size: 20),
              child: widget.trailingWidget!,
            ),
          ],
        ];
        break;

      case MenuItemLayout.bothSides:
        children = [
          // left: either custom leading widget OR checkbox
          if (widget.leadingWidget != null)
            IconTheme(
              data: IconThemeData(color: resolvedIconColor, size: 20),
              child: widget.leadingWidget!,
            )
          else if (widget.onCheckChanged != null) ...[
            GestureDetector(onTap: _toggleCheck, child: checkWidget),
            const SizedBox(width: 12),
          ],

          Expanded(child: labelWidget),

          // right: trailing widget if provided
          if (widget.trailingWidget != null) ...[
            const SizedBox(width: 12),
            IconTheme(
              data: IconThemeData(color: resolvedIconColor, size: 20),
              child: widget.trailingWidget!,
            ),
          ],
        ];
        break;

      case MenuItemLayout.checkLeft:
        children = [
          GestureDetector(onTap: _toggleCheck, child: checkWidget),
          const SizedBox(width: 12),
          Expanded(child: labelWidget),
          if (widget.trailingWidget != null) ...[
            const SizedBox(width: 12),
            widget.trailingWidget!,
          ],
        ];
        break;

      case MenuItemLayout.checkRight:
        children = [
          Expanded(child: labelWidget),
          const SizedBox(width: 12),
          GestureDetector(onTap: _toggleCheck, child: checkWidget),
        ];
        break;
    }

    return InkWell(
      onTap: () {
        widget.onTap?.call();
        if (widget.onCheckChanged != null) _toggleCheck();
      },
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(children: children),
      ),
    );
  }
}
