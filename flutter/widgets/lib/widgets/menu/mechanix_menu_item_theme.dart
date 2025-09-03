import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class MechanixMenuItemThemeData
    extends ThemeExtension<MechanixMenuItemThemeData> with Diagnosticable {
  const MechanixMenuItemThemeData({
    this.iconColor,
    this.textStyle,
  });

  final WidgetStateProperty<Color?>? iconColor;
  final TextStyle? textStyle;

  @override
  MechanixMenuItemThemeData copyWith({
    WidgetStateProperty<Color?>? iconColor,
    TextStyle? textStyle,
  }) {
    return MechanixMenuItemThemeData(
      iconColor: iconColor ?? this.iconColor,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  MechanixMenuItemThemeData lerp(
      ThemeExtension<MechanixMenuItemThemeData>? other, double t) {
    if (other is! MechanixMenuItemThemeData) return this;

    return MechanixMenuItemThemeData(
      iconColor: WidgetStateProperty.lerp<Color?>(
          iconColor, other.iconColor, t, Color.lerp),
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
    );
  }
}

class MechanixMenuItemTheme extends InheritedTheme {
  const MechanixMenuItemTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final MechanixMenuItemThemeData data;

  static MechanixMenuItemThemeData of(BuildContext context) {
    final theme =
        context.dependOnInheritedWidgetOfExactType<MechanixMenuItemTheme>();
    return theme?.data ??
        Theme.of(context).extension<MechanixMenuItemThemeData>() ??
        const MechanixMenuItemThemeData();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return MechanixMenuItemTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(MechanixMenuItemTheme oldWidget) =>
      data != oldWidget.data;
}
