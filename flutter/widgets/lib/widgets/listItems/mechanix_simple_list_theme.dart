import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class MechanixSimpleListThemeData
    extends ThemeExtension<MechanixSimpleListThemeData> with Diagnosticable {
  const MechanixSimpleListThemeData({
    this.backgroundColor,
    this.widgetRadius = const BorderRadius.all(Radius.circular(4)),
    this.dividerThickness = 1,
    this.dividerHeight = 1,
    this.dividerColor,
    this.itemPadding = const EdgeInsets.all(16),
  });

  final Color? backgroundColor;

  final Color? dividerColor;

  final BorderRadius? widgetRadius;

  final double? dividerThickness;

  final double? dividerHeight;

  final EdgeInsets? itemPadding;

  @override
  MechanixSimpleListThemeData copyWith({
    Color? backgroundColor,
    BorderRadius? widgetRadius,
    double? dividerThickness,
    double? dividerHeight,
    Color? dividerColor,
    EdgeInsets? itemPadding,
  }) {
    return MechanixSimpleListThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      widgetRadius: widgetRadius ?? this.widgetRadius,
      dividerThickness: dividerThickness ?? this.dividerThickness,
      dividerHeight: dividerHeight ?? this.dividerHeight,
      dividerColor: dividerColor ?? this.dividerColor,
      itemPadding: itemPadding ?? this.itemPadding,
    );
  }

  @override
  ThemeExtension<MechanixSimpleListThemeData> lerp(
      ThemeExtension<MechanixSimpleListThemeData>? other, double t) {
    final o = other as MechanixSimpleListThemeData?;
    return MechanixSimpleListThemeData(
      backgroundColor: Color.lerp(backgroundColor, o?.backgroundColor, t),
      dividerColor: Color.lerp(dividerColor, o?.dividerColor, t),
      widgetRadius: BorderRadius.lerp(widgetRadius, o?.widgetRadius, t),
      dividerThickness: lerpDouble(dividerThickness, o?.dividerThickness, t),
      dividerHeight: lerpDouble(dividerHeight, o?.dividerHeight, t),
      itemPadding: EdgeInsets.lerp(itemPadding, o?.itemPadding, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(DiagnosticsProperty('backgroundColor', backgroundColor));
    properties.add(DiagnosticsProperty('dividerColor', dividerColor));
    properties.add(DiagnosticsProperty('widgetRadius', widgetRadius));
    properties.add(DiagnosticsProperty('dividerThickness', dividerThickness));
    properties.add(DiagnosticsProperty('dividerHeight', dividerHeight));
    properties.add(DiagnosticsProperty('itemPadding', itemPadding));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MechanixSimpleListThemeData &&
        backgroundColor == other.backgroundColor &&
        dividerColor == other.dividerColor &&
        widgetRadius == other.widgetRadius &&
        dividerThickness == other.dividerThickness &&
        dividerHeight == other.dividerHeight &&
        itemPadding == other.itemPadding;
  }

  @override
  int get hashCode {
    return Object.hash(
      backgroundColor,
      dividerColor,
      widgetRadius,
      dividerThickness,
      dividerHeight,
      itemPadding,
    );
  }
}

class MechanixSimpleListTheme extends InheritedTheme {
  const MechanixSimpleListTheme({
    super.key,
    required this.style,
    required super.child,
  });

  final MechanixSimpleListThemeData style;

  static MechanixSimpleListThemeData of(BuildContext context) {
    final theme =
        context.dependOnInheritedWidgetOfExactType<MechanixSimpleListTheme>();
    return theme?.style ??
        Theme.of(context).extension<MechanixSimpleListThemeData>() ??
        const MechanixSimpleListThemeData();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return MechanixSimpleListTheme(
      style: style,
      child: child,
    );
  }

  @override
  bool updateShouldNotify(MechanixSimpleListTheme oldWidget) {
    return style != oldWidget.style;
  }
}
