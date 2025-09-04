import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class MechanixMenuThemeData extends ThemeExtension<MechanixMenuThemeData>
    with Diagnosticable {
  const MechanixMenuThemeData({
    this.backgroundColor,
    this.borderRadius,
    this.shadowColor,
  });

  final WidgetStateProperty<Color?>? backgroundColor;
  final double? borderRadius;
  final WidgetStateProperty<Color?>? shadowColor;

  @override
  MechanixMenuThemeData copyWith({
    WidgetStateProperty<Color?>? backgroundColor,
    double? borderRadius,
    WidgetStateProperty<Color?>? shadowColor,
  }) {
    return MechanixMenuThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      shadowColor: shadowColor ?? this.shadowColor,
    );
  }

  @override
  MechanixMenuThemeData lerp(
      ThemeExtension<MechanixMenuThemeData>? other, double t) {
    if (other is! MechanixMenuThemeData) return this;

    return MechanixMenuThemeData(
      backgroundColor: WidgetStateProperty.lerp<Color?>(
          backgroundColor, other.backgroundColor, t, Color.lerp),
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t),
      shadowColor: WidgetStateProperty.lerp<Color?>(
          shadowColor, other.shadowColor, t, Color.lerp),
    );
  }
}

class MechanixMenuTheme extends InheritedTheme {
  const MechanixMenuTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final MechanixMenuThemeData data;

  static MechanixMenuThemeData of(BuildContext context) {
    final theme =
        context.dependOnInheritedWidgetOfExactType<MechanixMenuTheme>();
    return theme?.data ??
        Theme.of(context).extension<MechanixMenuThemeData>() ??
        const MechanixMenuThemeData();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return MechanixMenuTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(MechanixMenuTheme oldWidget) =>
      data != oldWidget.data;
}
