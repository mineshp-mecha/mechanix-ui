import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class MechanixFabItemThemeData extends ThemeExtension<MechanixFabItemThemeData>
    with Diagnosticable {
  const MechanixFabItemThemeData({
    this.backgroundColor,
    this.iconColor,
    this.labelTextStyle,
    this.iconSize,
  });

  final WidgetStateProperty<Color?>? backgroundColor;
  final WidgetStateProperty<Color?>? iconColor;
  final TextStyle? labelTextStyle;
  final double? iconSize;

  @override
  MechanixFabItemThemeData copyWith({
    WidgetStateProperty<Color?>? backgroundColor,
    WidgetStateProperty<Color?>? iconColor,
    TextStyle? labelTextStyle,
    double? iconSize,
  }) {
    return MechanixFabItemThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      iconColor: iconColor ?? this.iconColor,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
      iconSize: iconSize ?? this.iconSize,
    );
  }

  @override
  MechanixFabItemThemeData lerp(
      ThemeExtension<MechanixFabItemThemeData>? other, double t) {
    if (other is! MechanixFabItemThemeData) return this;

    return MechanixFabItemThemeData(
      backgroundColor: WidgetStateProperty.lerp<Color?>(
          backgroundColor, other.backgroundColor, t, Color.lerp),
      iconColor: WidgetStateProperty.lerp<Color?>(
          iconColor, other.iconColor, t, Color.lerp),
      labelTextStyle: TextStyle.lerp(labelTextStyle, other.labelTextStyle, t),
      iconSize: lerpDouble(iconSize, other.iconSize, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('backgroundColor', backgroundColor));
    properties.add(DiagnosticsProperty('iconColor', iconColor));
    properties.add(DiagnosticsProperty('labelTextStyle', labelTextStyle));
    properties.add(DoubleProperty('iconSize', iconSize));
  }
}

class MechanixFabItemTheme extends InheritedTheme {
  const MechanixFabItemTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final MechanixFabItemThemeData data;

  static MechanixFabItemThemeData of(BuildContext context) {
    final theme =
        context.dependOnInheritedWidgetOfExactType<MechanixFabItemTheme>();
    return theme?.data ??
        Theme.of(context).extension<MechanixFabItemThemeData>() ??
        const MechanixFabItemThemeData();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return MechanixFabItemTheme(
      data: data,
      child: child,
    );
  }

  @override
  bool updateShouldNotify(MechanixFabItemTheme oldWidget) {
    return data != oldWidget.data;
  }
}
