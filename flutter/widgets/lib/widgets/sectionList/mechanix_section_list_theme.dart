import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class MechanixSectionListThemeData
    extends ThemeExtension<MechanixSectionListThemeData> with Diagnosticable {
  const MechanixSectionListThemeData(
      {this.backgroundColor,
      this.titleTextStyle,
      this.dividerThickness = 1,
      this.dividerHeight = 1,
      this.dividerColor});

  final WidgetStateProperty<Color?>? backgroundColor;
  final TextStyle? titleTextStyle;
  final double? dividerThickness;
  final double? dividerHeight;
  final Color? dividerColor;

  @override
  MechanixSectionListThemeData copyWith({
    WidgetStateProperty<Color?>? backgroundColor,
    TextStyle? titleTextStyle,
    double? dividerThickness,
    double? dividerHeight,
    Color? dividerColor,
  }) {
    return MechanixSectionListThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      dividerThickness: dividerThickness ?? this.dividerThickness,
      dividerHeight: dividerHeight ?? this.dividerHeight,
      dividerColor: dividerColor ?? this.dividerColor,
    );
  }

  @override
  ThemeExtension<MechanixSectionListThemeData> lerp(
      ThemeExtension<MechanixSectionListThemeData>? other, double t) {
    final o = other as MechanixSectionListThemeData?;
    return MechanixSectionListThemeData(
      backgroundColor: WidgetStateProperty.lerp<Color?>(
          backgroundColor, o?.backgroundColor, t, Color.lerp),
      titleTextStyle: TextStyle.lerp(titleTextStyle, o?.titleTextStyle, t),
      dividerThickness: lerpDouble(dividerThickness, o?.dividerThickness, t),
      dividerHeight: lerpDouble(dividerHeight, o?.dividerThickness, t),
      dividerColor: Color.lerp(dividerColor, o?.dividerColor, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('backgroundColor', backgroundColor));
    properties.add(DiagnosticsProperty('titleTextStyle', titleTextStyle));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MechanixSectionListThemeData &&
        backgroundColor == other.backgroundColor &&
        titleTextStyle == other.titleTextStyle;
  }

  @override
  int get hashCode {
    return Object.hash(backgroundColor, titleTextStyle);
  }
}

class MechanixSectionListTheme extends InheritedTheme {
  const MechanixSectionListTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final MechanixSectionListThemeData data;

  static MechanixSectionListThemeData of(BuildContext context) {
    final theme =
        context.dependOnInheritedWidgetOfExactType<MechanixSectionListTheme>();
    return theme?.data ??
        Theme.of(context).extension<MechanixSectionListThemeData>() ??
        const MechanixSectionListThemeData();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return MechanixSectionListTheme(
      data: data,
      child: child,
    );
  }

  @override
  bool updateShouldNotify(MechanixSectionListTheme oldWidget) {
    return data != oldWidget.data;
  }
}
