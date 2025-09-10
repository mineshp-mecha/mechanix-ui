import 'package:flutter/material.dart';
import 'package:widgets/extension.dart';
import 'package:widgets/widgets/select/mechanix_select_theme.dart';
import 'package:widgets/widgets/select/select_type.dart';

class MechanixSelect<T> extends StatelessWidget {
  const MechanixSelect({
    super.key,
    required this.options,
    required this.onChanged,
    this.value,
    this.trailingIcon = Icons.check,
    this.divider,
    this.scrollPhysics = const ClampingScrollPhysics(),
    this.shrinkWrap = true,
    this.primary = false,
    this.trailingIconSize = 20,
  });

  final List<SelectOption<T>> options;
  final T? value;
  final ValueChanged<SelectOption<T>> onChanged;
  final Widget? divider;
  final IconData? trailingIcon;
  final ScrollPhysics? scrollPhysics;
  final bool shrinkWrap;
  final bool? primary;
  final double trailingIconSize;

  bool _isSelected(SelectOption<T> option) => option.value == value;

  @override
  Widget build(BuildContext context) {
    final selectTheme = MechanixSelectTheme.of(context);

    return Material(
      elevation: selectTheme.elevation,
      borderRadius: selectTheme.borderRadius ?? BorderRadius.circular(8),
      color: selectTheme.backgroundColor ?? context.colorScheme.secondary,
      child: ListView.separated(
        physics: scrollPhysics,
        shrinkWrap: shrinkWrap,
        primary: primary,
        itemCount: options.length,
        separatorBuilder: (context, index) =>
            divider ??
            Divider(height: 1, color: context.colorScheme.outline)
                .padHorizontal(16),
        itemBuilder: (context, index) {
          final option = options[index];
          final isSelected = _isSelected(option);

          return _SelectItem(
            option: option,
            isSelected: isSelected,
            selectionColor:
                selectTheme.selectionColor ?? context.colorScheme.outline,
            titleStyle: selectTheme.titleStyle ?? context.textTheme.bodyMedium,
            selectedTitleStyle:
                selectTheme.selectedTitleStyle ?? selectTheme.titleStyle,
            leadingPadding: selectTheme.leadingPadding,
            trailingIcon: trailingIcon,
            trailingIconColor:
                selectTheme.trailingIconColor ?? context.colorScheme.onSurface,
            padding: selectTheme.optionPadding,
            onTap: () => onChanged(option),
            trailingIconSize: trailingIconSize,
          );
        },
      ),
    );
  }
}

class _SelectItem<T> extends StatelessWidget {
  const _SelectItem({
    required this.option,
    required this.isSelected,
    required this.selectionColor,
    required this.titleStyle,
    required this.selectedTitleStyle,
    required this.leadingPadding,
    required this.trailingIcon,
    required this.trailingIconColor,
    required this.padding,
    required this.onTap,
    required this.trailingIconSize,
  });

  final SelectOption<T> option;
  final bool isSelected;
  final Color selectionColor;
  final TextStyle? titleStyle;
  final TextStyle? selectedTitleStyle;
  final EdgeInsets? leadingPadding;
  final IconData? trailingIcon;
  final Color trailingIconColor;
  final EdgeInsetsGeometry padding;
  final VoidCallback onTap;
  final double trailingIconSize;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? selectionColor : Colors.transparent,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Padding(
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    if (option.leading != null)
                      Padding(
                        padding: leadingPadding ?? EdgeInsets.all(0),
                        child: option.leading!,
                      ),
                    Expanded(
                      child: Text(
                        option.label,
                        style: isSelected ? selectedTitleStyle : titleStyle,
                        overflow: TextOverflow.visible,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
              if (option.trailing != null) option.trailing!,
              if (isSelected && option.trailing == null)
                Icon(
                  trailingIcon,
                  color: trailingIconColor,
                  size: trailingIconSize,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
