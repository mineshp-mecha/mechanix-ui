import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class MechanixNavigationBarThemeData
    extends ThemeExtension<MechanixNavigationBarThemeData> with Diagnosticable {
  const MechanixNavigationBarThemeData(
      {this.centerTitle = false,
      this.automaticallyImplyLeading = true,
      this.leadingWidth,
      this.height,
      this.titleStyle,
      this.backgroundColor,
      this.foregroundColor,
      this.elevation,
      this.actionsIconTheme,
      this.titleSpacing,
      this.scrolledUnderElevation});

  final bool? centerTitle;
  final bool automaticallyImplyLeading;
  final double? leadingWidth;
  final double? height;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final IconThemeData? actionsIconTheme;
  final double? titleSpacing;
  final double? scrolledUnderElevation;

  @override
  MechanixNavigationBarThemeData copyWith({
    bool? centerTitle,
    bool? automaticallyImplyLeading,
    double? leadingWidth,
    double? height,
    TextStyle? titleStyle,
    Color? backgroundColor,
    Color? foregroundColor,
    double? elevation,
    IconThemeData? actionsIconTheme,
    double? titleSpacing,
    double? scrolledUnderElevation,
  }) {
    return MechanixNavigationBarThemeData(
      centerTitle: centerTitle ?? this.centerTitle,
      scrolledUnderElevation:
          scrolledUnderElevation ?? this.scrolledUnderElevation,
      automaticallyImplyLeading:
          automaticallyImplyLeading ?? this.automaticallyImplyLeading,
      leadingWidth: leadingWidth ?? this.leadingWidth,
      height: height ?? this.height,
      titleStyle: titleStyle ?? this.titleStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      elevation: elevation ?? this.elevation,
      actionsIconTheme: actionsIconTheme ?? this.actionsIconTheme,
      titleSpacing: titleSpacing ?? this.titleSpacing,
    );
  }

  MechanixNavigationBarThemeData mergeWith({
    bool? centerTitle,
    bool? automaticallyImplyLeading,
    double? leadingWidth,
    double? height,
    TextStyle? titleStyle,
    Color? backgroundColor,
    Color? foregroundColor,
    double? elevation,
    IconThemeData? actionsIconTheme,
    double? titleSpacing,
    double? scrolledUnderElevation,
  }) {
    return copyWith(
      centerTitle: centerTitle ?? this.centerTitle,
      scrolledUnderElevation:
          scrolledUnderElevation ?? this.scrolledUnderElevation,
      automaticallyImplyLeading:
          automaticallyImplyLeading ?? this.automaticallyImplyLeading,
      leadingWidth: leadingWidth ?? this.leadingWidth,
      height: height ?? this.height,
      titleStyle: titleStyle ?? this.titleStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      elevation: elevation ?? this.elevation,
      actionsIconTheme: actionsIconTheme ?? this.actionsIconTheme,
      titleSpacing: titleSpacing ?? this.titleSpacing,
    );
  }

  @override
  ThemeExtension<MechanixNavigationBarThemeData> lerp(
    ThemeExtension<MechanixNavigationBarThemeData>? other,
    double t,
  ) {
    final o = other as MechanixNavigationBarThemeData?;
    if (o == null) return this;

    return MechanixNavigationBarThemeData(
      centerTitle: t < 0.5 ? centerTitle : o.centerTitle,
      scrolledUnderElevation:
          lerpDouble(scrolledUnderElevation, o.scrolledUnderElevation, t),
      automaticallyImplyLeading:
          t < 0.5 ? automaticallyImplyLeading : o.automaticallyImplyLeading,
      leadingWidth: lerpDouble(leadingWidth, o.leadingWidth, t),
      height: lerpDouble(height, o.height, t),
      titleStyle: TextStyle.lerp(titleStyle, o.titleStyle, t),
      backgroundColor: Color.lerp(backgroundColor, o.backgroundColor, t),
      foregroundColor: Color.lerp(foregroundColor, o.foregroundColor, t),
      elevation: lerpDouble(elevation, o.elevation, t),
      actionsIconTheme:
          IconThemeData.lerp(actionsIconTheme, o.actionsIconTheme, t),
      titleSpacing: lerpDouble(titleSpacing, o.titleSpacing, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(DoubleProperty('height', height));
    properties.add(FlagProperty(
      'automaticallyImplyLeading',
      value: automaticallyImplyLeading,
      ifTrue: 'true',
      ifFalse: 'false',
    ));
    properties.add(FlagProperty(
      'centerTitle',
      value: centerTitle,
      ifTrue: 'true',
      ifFalse: 'false',
    ));
    properties.add(DoubleProperty('leadingWidth', leadingWidth));
    properties.add(DoubleProperty('titleSpacing', titleSpacing));
    properties.add(DiagnosticsProperty<TextStyle?>('titleStyle', titleStyle));
    properties.add(ColorProperty('backgroundColor', backgroundColor));
    properties.add(ColorProperty('foregroundColor', foregroundColor));
    properties.add(DoubleProperty('elevation', elevation));
    properties
        .add(DoubleProperty('scrolledUnderElevation', scrolledUnderElevation));
    properties.add(DiagnosticsProperty<IconThemeData?>(
        'actionsIconTheme', actionsIconTheme));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MechanixNavigationBarThemeData &&
        other.height == height &&
        other.automaticallyImplyLeading == automaticallyImplyLeading &&
        other.centerTitle == centerTitle &&
        other.titleSpacing == titleSpacing &&
        other.titleStyle == titleStyle &&
        other.leadingWidth == leadingWidth &&
        other.backgroundColor == backgroundColor &&
        other.foregroundColor == foregroundColor &&
        other.elevation == elevation &&
        other.scrolledUnderElevation == scrolledUnderElevation &&
        other.actionsIconTheme == actionsIconTheme;
  }

  @override
  int get hashCode {
    return Object.hash(
        height,
        automaticallyImplyLeading,
        centerTitle,
        titleSpacing,
        titleStyle,
        leadingWidth,
        backgroundColor,
        foregroundColor,
        elevation,
        actionsIconTheme,
        scrolledUnderElevation);
  }
}

class MechanixNavigationBarTheme extends InheritedTheme {
  const MechanixNavigationBarTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final MechanixNavigationBarThemeData data;

  static MechanixNavigationBarThemeData of(BuildContext context) {
    final theme = context
        .dependOnInheritedWidgetOfExactType<MechanixNavigationBarTheme>();
    return theme?.data ??
        Theme.of(context).extension<MechanixNavigationBarThemeData>() ??
        const MechanixNavigationBarThemeData();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return MechanixNavigationBarTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(MechanixNavigationBarTheme oldWidget) {
    return data != oldWidget.data;
  }
}
