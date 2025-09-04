import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class MechanixListItemThemeData
    extends ThemeExtension<MechanixListItemThemeData> with Diagnosticable {
  const MechanixListItemThemeData(
      {this.titleTextStyle,
      this.subTitleTextStyle,
      this.splashColor,
      this.padding,
      this.backgroundColor});

  final TextStyle? titleTextStyle;

  final TextStyle? subTitleTextStyle;

  final EdgeInsets? padding;

  final WidgetStateProperty<Color?>? splashColor;

  final Color? backgroundColor;

  @override
  MechanixListItemThemeData copyWith({
    TextStyle? titleTextStyle,
    TextStyle? subTitleTextStyle,
    WidgetStateProperty<Color?>? splashColor,
    EdgeInsets? padding,
    Color? backgroundColor,
  }) {
    return MechanixListItemThemeData(
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      subTitleTextStyle: subTitleTextStyle ?? this.subTitleTextStyle,
      splashColor: splashColor ?? this.splashColor,
      padding: padding ?? this.padding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  ThemeExtension<MechanixListItemThemeData> lerp(
      ThemeExtension<MechanixListItemThemeData>? other, double t) {
    final o = other as MechanixListItemThemeData?;
    return MechanixListItemThemeData(
      titleTextStyle: TextStyle.lerp(titleTextStyle, o?.titleTextStyle, t),
      subTitleTextStyle:
          TextStyle.lerp(subTitleTextStyle, o?.subTitleTextStyle, t),
      splashColor: WidgetStateProperty.lerp<Color?>(
          splashColor, o?.splashColor, t, Color.lerp),
      padding: EdgeInsets.lerp(padding, o?.padding, t),
      backgroundColor: Color.lerp(backgroundColor, o?.backgroundColor, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('titleTextStyle', titleTextStyle));
    properties.add(DiagnosticsProperty('subTitleTextStyle', subTitleTextStyle));
    properties.add(DiagnosticsProperty('splashColor', splashColor));
    properties.add(DiagnosticsProperty('backgroundColor', backgroundColor));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MechanixListItemThemeData &&
        titleTextStyle == other.titleTextStyle &&
        subTitleTextStyle == other.subTitleTextStyle &&
        splashColor == other.splashColor &&
        padding == other.padding &&
        backgroundColor == other.backgroundColor;
  }

  @override
  int get hashCode {
    return Object.hash(titleTextStyle, subTitleTextStyle, splashColor, padding,
        backgroundColor);
  }
}

class MechanixListItemTheme extends InheritedTheme {
  const MechanixListItemTheme({
    super.key,
    required this.style,
    required super.child,
  });

  final MechanixListItemThemeData style;

  static MechanixListItemThemeData of(BuildContext context) {
    final theme =
        context.dependOnInheritedWidgetOfExactType<MechanixListItemTheme>();
    return theme?.style ??
        Theme.of(context).extension<MechanixListItemThemeData>() ??
        const MechanixListItemThemeData();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return MechanixListItemTheme(
      style: style,
      child: child,
    );
  }

  @override
  bool updateShouldNotify(MechanixListItemTheme oldWidget) {
    return style != oldWidget.style;
  }
}
