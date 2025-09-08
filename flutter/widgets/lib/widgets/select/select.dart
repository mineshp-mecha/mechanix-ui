import 'package:flutter/material.dart';
import 'package:widgets/mechanix.dart';
import 'package:widgets/widgets/select/select_type.dart';

class MechanixSelect extends StatelessWidget {
  const MechanixSelect({
    super.key,
    required this.options,
    this.selectionColor,
    this.titleStyle,
    this.onTap,
    required this.onChanged,
    required this.selectValue,
  });

  final List<SelectOption> options;

  final Color? selectionColor;

  final TextStyle? titleStyle;

  final GestureTapCallback? onTap;

  final String? selectValue;

  final ValueChanged<SelectOption> onChanged;

  Widget buildList(BuildContext context, SelectOption option) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onChanged(option),
        child: Container(
          color: option.value == selectValue
              ? (selectionColor ?? Color(0xFF464646))
              : context.colorScheme.secondary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (option.leading != null) option.leading!.padRight(),
                  Text(option.label,
                      style: titleStyle ?? context.textTheme.labelMedium),
                ],
              ),
              if (option.value == selectValue) Icon(Icons.check)
            ],
          ).padAll(18),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.secondary,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: options.length,
        itemBuilder: (context, index) {
          final option = options[index];
          return buildList(context, option);
        },
      ),
    );
  }
}
