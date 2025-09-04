import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class MechanixPressableListThemeData
    extends ThemeExtension<MechanixPressableListThemeData> with Diagnosticable {
  const MechanixPressableListThemeData({
    this.titleTextStyle,
    this.backgroundColor,
    this.itemPadding,
    this.leadingIconPadding,
    this.trailingPadding,
    this.checkboxSpacing,
    this.checkboxColor,
    this.mouseCursor,
    this.borderRadius,
  });

  final TextStyle? titleTextStyle;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? itemPadding;
  final EdgeInsetsGeometry? leadingIconPadding;
  final EdgeInsetsGeometry? trailingPadding;
  final EdgeInsetsGeometry? checkboxSpacing;
  final Color? checkboxColor;
  final MouseCursor? mouseCursor;
  final BorderRadius? borderRadius;

  @override
  MechanixPressableListThemeData copyWith({
    TextStyle? titleTextStyle,
    Color? backgroundColor,
    EdgeInsetsGeometry? itemPadding,
    EdgeInsetsGeometry? leadingIconPadding,
    EdgeInsetsGeometry? trailingPadding,
    EdgeInsetsGeometry? checkboxSpacing,
    Color? checkboxColor,
    MouseCursor? mouseCursor,
    BorderRadius? borderRadius,
  }) {
    return MechanixPressableListThemeData(
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      itemPadding: itemPadding ?? this.itemPadding,
      leadingIconPadding: leadingIconPadding ?? this.leadingIconPadding,
      trailingPadding: trailingPadding ?? this.trailingPadding,
      checkboxSpacing: checkboxSpacing ?? this.checkboxSpacing,
      checkboxColor: checkboxColor ?? this.checkboxColor,
      mouseCursor: mouseCursor ?? this.mouseCursor,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  MechanixPressableListThemeData mergeWith({
    TextStyle? titleTextStyle,
    Color? backgroundColor,
    EdgeInsetsGeometry? itemPadding,
    EdgeInsetsGeometry? leadingIconPadding,
    EdgeInsetsGeometry? trailingPadding,
    EdgeInsetsGeometry? checkboxSpacing,
    Color? checkboxColor,
    MouseCursor? mouseCursor,
    BorderRadius? borderRadius,
  }) {
    return copyWith(
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      itemPadding: itemPadding ?? this.itemPadding,
      leadingIconPadding: leadingIconPadding ?? this.leadingIconPadding,
      trailingPadding: trailingPadding ?? this.trailingPadding,
      checkboxSpacing: checkboxSpacing ?? this.checkboxSpacing,
      checkboxColor: checkboxColor ?? this.checkboxColor,
      mouseCursor: mouseCursor ?? this.mouseCursor,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  ThemeExtension<MechanixPressableListThemeData> lerp(
    ThemeExtension<MechanixPressableListThemeData>? other,
    double t,
  ) {
    final o = other as MechanixPressableListThemeData?;
    if (o == null) return this;

    return MechanixPressableListThemeData(
      titleTextStyle: TextStyle.lerp(titleTextStyle, o.titleTextStyle, t),
      backgroundColor: Color.lerp(backgroundColor, o.backgroundColor, t),
      itemPadding: EdgeInsetsGeometry.lerp(itemPadding, o.itemPadding, t),
      leadingIconPadding:
          EdgeInsetsGeometry.lerp(leadingIconPadding, o.leadingIconPadding, t),
      trailingPadding:
          EdgeInsetsGeometry.lerp(trailingPadding, o.trailingPadding, t),
      checkboxSpacing:
          EdgeInsetsGeometry.lerp(checkboxSpacing, o.checkboxSpacing, t),
      checkboxColor: Color.lerp(checkboxColor, o.checkboxColor, t),
      mouseCursor: t < 0.5 ? mouseCursor : o.mouseCursor,
      borderRadius: BorderRadius.lerp(borderRadius, o.borderRadius, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
        .add(DiagnosticsProperty<TextStyle?>('titleTextStyle', titleTextStyle));
    properties.add(ColorProperty('backgroundColor', backgroundColor));
    properties.add(
        DiagnosticsProperty<EdgeInsetsGeometry?>('itemPadding', itemPadding));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry?>(
        'leadingIconPadding', leadingIconPadding));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry?>(
        'trailingPadding', trailingPadding));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry?>(
        'checkboxSpacing', checkboxSpacing));
    properties.add(ColorProperty('checkboxColor', checkboxColor));
    properties
        .add(DiagnosticsProperty<MouseCursor?>('mouseCursor', mouseCursor));
    properties
        .add(DiagnosticsProperty<BorderRadius?>('borderRadius', borderRadius));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MechanixPressableListThemeData &&
        other.titleTextStyle == titleTextStyle &&
        other.backgroundColor == backgroundColor &&
        other.itemPadding == itemPadding &&
        other.leadingIconPadding == leadingIconPadding &&
        other.trailingPadding == trailingPadding &&
        other.checkboxSpacing == checkboxSpacing &&
        other.checkboxColor == checkboxColor &&
        other.mouseCursor == mouseCursor &&
        other.borderRadius == borderRadius;
  }

  @override
  int get hashCode {
    return Object.hash(
      titleTextStyle,
      backgroundColor,
      itemPadding,
      leadingIconPadding,
      trailingPadding,
      checkboxSpacing,
      checkboxColor,
      mouseCursor,
      borderRadius,
    );
  }
}

class MechanixPressableListTheme extends InheritedTheme {
  const MechanixPressableListTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final MechanixPressableListThemeData data;

  static MechanixPressableListThemeData of(BuildContext context) {
    final theme = context
        .dependOnInheritedWidgetOfExactType<MechanixPressableListTheme>();
    return theme?.data ??
        Theme.of(context).extension<MechanixPressableListThemeData>() ??
        const MechanixPressableListThemeData();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return MechanixPressableListTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(MechanixPressableListTheme oldWidget) {
    return data != oldWidget.data;
  }
}
