import 'package:flutter/material.dart';

@immutable
class SelectOption<T> {
  const SelectOption({
    required this.value,
    required this.label,
    this.leading,
    this.trailing,
  });

  final T value;
  final String label;
  final Widget? leading;
  final Widget? trailing;
}
