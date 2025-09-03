import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class MechanixFabThemeData extends ThemeExtension<MechanixFabThemeData>
    with Diagnosticable {
  const MechanixFabThemeData({
    this.backgroundColor,
    this.size,
    this.borderRadius,
    this.shadowColor,
  });

  /// Allows state-aware colors (normal, hovered, pressed, disabled).
  final WidgetStateProperty<Color?>? backgroundColor;

  /// FAB size (width/height).
  final double? size;

  /// FAB border radius.
  final double? borderRadius;

  /// Shadow color of the FAB.
  final WidgetStateProperty<Color?>? shadowColor;

  // final double? iconSize;

  @override
  MechanixFabThemeData copyWith({
    WidgetStateProperty<Color?>? backgroundColor,
    WidgetStateProperty<Color?>? iconColor,
    double? size,
    double? borderRadius,
    WidgetStateProperty<Color?>? shadowColor,
  }) {
    return MechanixFabThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      size: size ?? this.size,
      borderRadius: borderRadius ?? this.borderRadius,
      shadowColor: shadowColor ?? this.shadowColor,
    );
  }

  @override
  ThemeExtension<MechanixFabThemeData> lerp(
      ThemeExtension<MechanixFabThemeData>? other, double t) {
    if (other is! MechanixFabThemeData) return this;

    return MechanixFabThemeData(
      backgroundColor: WidgetStateProperty.lerp<Color?>(
          backgroundColor, other.backgroundColor, t, Color.lerp),
      size: lerpDouble(size, other.size, t),
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t),
      shadowColor: WidgetStateProperty.lerp<Color?>(
          shadowColor, other.shadowColor, t, Color.lerp),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('backgroundColor', backgroundColor));
    // properties.add(DiagnosticsProperty('iconColor', iconColor));
    properties.add(DoubleProperty('size', size));
    properties.add(DoubleProperty('borderRadius', borderRadius));
    properties.add(DiagnosticsProperty('shadowColor', shadowColor));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MechanixFabThemeData &&
        backgroundColor == other.backgroundColor &&
        // iconColor == other.iconColor &&
        // iconSize == other.iconSize &&
        size == other.size &&
        borderRadius == other.borderRadius &&
        shadowColor == other.shadowColor;
  }

  @override
  int get hashCode {
    return Object.hash(backgroundColor, size, borderRadius, shadowColor);
  }
}

class MechanixFabTheme extends InheritedTheme {
  const MechanixFabTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final MechanixFabThemeData data;

  static MechanixFabThemeData of(BuildContext context) {
    final theme =
        context.dependOnInheritedWidgetOfExactType<MechanixFabTheme>();
    return theme?.data ??
        Theme.of(context).extension<MechanixFabThemeData>() ??
        const MechanixFabThemeData();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return MechanixFabTheme(
      data: data,
      child: child,
    );
  }

  @override
  bool updateShouldNotify(MechanixFabTheme oldWidget) {
    return data != oldWidget.data;
  }
}
