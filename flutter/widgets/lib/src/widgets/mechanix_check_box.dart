import 'package:flutter/material.dart';

/// circular checkbox
class MechanixCircleCheckbox extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final bool tristate;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color activeColor;
  final double width;
  final double height;

  const MechanixCircleCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.tristate = false,
    this.focusNode,
    this.autofocus = false,
    required this.activeColor,
    this.width = 22,
    this.height = 22,
  });

  @override
  Widget build(BuildContext context) {
    final bool? checked = value;
    return InkWell(
      onTap: onChanged == null
          ? null
          : () {
              switch (checked) {
                case false:
                  onChanged!(true);
                  break;
                case true:
                  onChanged!(tristate ? null : false);
                  break;
                case null:
                  onChanged!(false);
                  break;
              }
            },
      customBorder: const CircleBorder(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: checked == true ? activeColor : Colors.transparent,
          border: Border.all(
            color: checked == true ? activeColor : Colors.grey.shade600,
            width: 2,
          ),
        ),
        child: checked == true
            ? const Icon(Icons.check, size: 16, color: Colors.white)
            : null,
      ),
    );
  }
}
