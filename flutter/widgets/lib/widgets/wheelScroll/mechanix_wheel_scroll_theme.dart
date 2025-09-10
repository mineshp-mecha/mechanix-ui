import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class MechanixWheelScrollThemeData
    extends ThemeExtension<MechanixWheelScrollThemeData> with Diagnosticable {
  const MechanixWheelScrollThemeData({
    this.selectionPadding = const EdgeInsets.symmetric(vertical: 14),
    this.selectedTextStyle = const TextStyle(fontSize: 24, color: Colors.white),
    this.notSelectedTextStyle = const TextStyle(
      fontSize: 20,
    ),
    this.selectionColor,
    this.selectionBorderRadius = const BorderRadius.all(Radius.circular(8)),
  });

  final EdgeInsets selectionPadding;
  final TextStyle? selectedTextStyle;
  final TextStyle? notSelectedTextStyle;
  final Color? selectionColor;
  final BorderRadius? selectionBorderRadius;

  @override
  MechanixWheelScrollThemeData copyWith({
    EdgeInsets? selectionPadding,
    TextStyle? selectedTextStyle,
    TextStyle? notSelectedTextStyle,
    Color? selectionColor,
    BorderRadius? selectionBorderRadius,
  }) {
    return MechanixWheelScrollThemeData(
      selectionPadding: selectionPadding ?? this.selectionPadding,
      selectedTextStyle: selectedTextStyle ?? this.selectedTextStyle,
      notSelectedTextStyle: notSelectedTextStyle ?? this.notSelectedTextStyle,
      selectionColor: selectionColor ?? this.selectionColor,
      selectionBorderRadius:
          selectionBorderRadius ?? this.selectionBorderRadius,
    );
  }

  @override
  ThemeExtension<MechanixWheelScrollThemeData> lerp(
    ThemeExtension<MechanixWheelScrollThemeData>? other,
    double t,
  ) {
    if (other is! MechanixWheelScrollThemeData) {
      return this;
    }

    return MechanixWheelScrollThemeData(
      selectionPadding:
          EdgeInsets.lerp(selectionPadding, other.selectionPadding, t) ??
              selectionPadding,
      selectedTextStyle:
          TextStyle.lerp(selectedTextStyle, other.selectedTextStyle, t),
      notSelectedTextStyle:
          TextStyle.lerp(notSelectedTextStyle, other.notSelectedTextStyle, t),
      selectionColor: Color.lerp(selectionColor, other.selectionColor, t),
      selectionBorderRadius: BorderRadius.lerp(
          selectionBorderRadius, other.selectionBorderRadius, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<EdgeInsets>('selectionPadding', selectionPadding));
    properties.add(
        DiagnosticsProperty<TextStyle>('selectedTextStyle', selectedTextStyle));
    properties.add(DiagnosticsProperty<TextStyle>(
        'notSelectedTextStyle', notSelectedTextStyle));
    properties
        .add(DiagnosticsProperty<Color>('selectionColor', selectionColor));
    properties.add(DiagnosticsProperty<BorderRadius>(
        'selectionBorderRadius', selectionBorderRadius));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;

    return other is MechanixWheelScrollThemeData &&
        other.selectionPadding == selectionPadding &&
        other.selectedTextStyle == selectedTextStyle &&
        other.notSelectedTextStyle == notSelectedTextStyle &&
        other.selectionColor == selectionColor &&
        other.selectionBorderRadius == selectionBorderRadius;
  }

  @override
  int get hashCode {
    return Object.hash(
      selectionPadding,
      selectedTextStyle,
      notSelectedTextStyle,
      selectionColor,
      selectionBorderRadius,
    );
  }
}

class MechanixWheelScrollTheme extends InheritedTheme {
  const MechanixWheelScrollTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final MechanixWheelScrollThemeData data;

  static MechanixWheelScrollThemeData of(BuildContext context) {
    final theme =
        context.dependOnInheritedWidgetOfExactType<MechanixWheelScrollTheme>();
    return theme?.data ??
        Theme.of(context).extension<MechanixWheelScrollThemeData>() ??
        const MechanixWheelScrollThemeData();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return MechanixWheelScrollTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(MechanixWheelScrollTheme oldWidget) {
    return data != oldWidget.data;
  }
}
