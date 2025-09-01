import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class MechanixSectionListItemThemeData
    extends ThemeExtension<MechanixSectionListItemThemeData>
    with Diagnosticable {
  const MechanixSectionListItemThemeData({
    this.backGroundColor,
    // this.size,
    // this.weight,
    // this.fontVariation,
    this.titleTextStyle,
  });

  final WidgetStateProperty<Color?>? backGroundColor;
  // final WidgetStateProperty<double?>? size;
  // final WidgetStateProperty<FontWeight?>? weight;
  // final WidgetStateProperty<FontVariation?>? fontVariation;
  final TextStyle? titleTextStyle;

  @override
  MechanixSectionListItemThemeData copyWith(
      {WidgetStateProperty<Color?>? backGroundColor,
      // WidgetStateProperty<double?>? size,
      // WidgetStateProperty<FontWeight?>? weight,
      // WidgetStateProperty<FontVariation?>? fontVariation,
      TextStyle? titleTextStyle}) {
    return MechanixSectionListItemThemeData(
        backGroundColor: backGroundColor ?? this.backGroundColor,
        // size: size ?? this.size,
        // weight: weight ?? this.weight,
        // fontVariation: fontVariation ?? this.fontVariation,
        titleTextStyle: titleTextStyle ?? this.titleTextStyle);
  }

  @override
  ThemeExtension<MechanixSectionListItemThemeData> lerp(
      ThemeExtension<MechanixSectionListItemThemeData>? other, double t) {
    final o = other as MechanixSectionListItemThemeData?;
    return MechanixSectionListItemThemeData(
        backGroundColor: WidgetStateProperty.lerp<Color?>(
            backGroundColor, o?.backGroundColor, t, Color.lerp),
        // size: WidgetStateProperty.lerp<double?>(size, o?.size, t, lerpDouble),
        // weight: WidgetStateProperty.lerp<FontWeight?>(
        //     weight, o?.weight, t, FontWeight.lerp),
        // fontVariation: WidgetStateProperty.lerp<FontVariation?>(
        //     fontVariation, o?.fontVariation, t, FontVariation.lerp),
        titleTextStyle: titleTextStyle);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('backGroundColor', backGroundColor));
    // properties.add(DiagnosticsProperty('size', size));
    // properties.add(DiagnosticsProperty('weight', weight));
    // properties.add(DiagnosticsProperty('fontVariation', fontVariation));
    properties.add(DiagnosticsProperty('titleTextStyle', titleTextStyle));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MechanixSectionListItemThemeData &&
        backGroundColor == other.backGroundColor &&
        titleTextStyle == other.titleTextStyle;
    // size == other.size &&
    // weight == other.weight &&
    // fontVariation == other.fontVariation &&
  }

  // color, size, weight, fontVariation,
  @override
  int get hashCode {
    return Object.hash(backGroundColor, titleTextStyle);
  }

  // Convenience getter to create TextStyle from theme properties
  // TextStyle getTextStyle(Set<WidgetState> states) {
  //   return TextStyle(
  //     color: color?.resolve(states),
  //     fontSize: size?.resolve(states),
  //     fontWeight: weight?.resolve(states),
  //     fontVariations: fontVariation?.resolve(states) != null
  //         ? [fontVariation!.resolve(states)!]
  //         : null,
  //   );
  // }
}

class MechanixSectionListItemTheme extends InheritedTheme {
  const MechanixSectionListItemTheme({
    super.key,
    required this.style,
    required super.child,
  });

  final MechanixSectionListItemThemeData style;

  static MechanixSectionListItemThemeData of(BuildContext context) {
    final theme = context
        .dependOnInheritedWidgetOfExactType<MechanixSectionListItemTheme>();
    return theme?.style ??
        Theme.of(context).extension<MechanixSectionListItemThemeData>() ??
        const MechanixSectionListItemThemeData();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return MechanixSectionListItemTheme(
      style: style,
      child: child,
    );
  }

  @override
  bool updateShouldNotify(MechanixSectionListItemTheme oldWidget) {
    return style != oldWidget.style;
  }
}

// class MechanixSectionListItemStyle with Diagnosticable {
//   const MechanixSectionListItemStyle(
//       {this.titleColor, this.titleSize, this.subTitleColor, this.subTitleSize});

//   final Color? titleColor;

//   final double? titleSize;

//   final Color? subTitleColor;

//   final double? subTitleSize;

//   MechanixSectionListItemStyle copyWith({
//     Color? titleColor,
//     double? titleSize,
//     Color? subTitleColor,
//     double? subTitleSize,
//   }) =>
//       MechanixSectionListItemStyle(
//         titleColor: titleColor ?? this.titleColor,
//         titleSize: titleSize ?? this.titleSize,
//         subTitleColor: subTitleColor ?? this.subTitleColor,
//         subTitleSize: subTitleSize ?? this.subTitleSize,
//       );

//   MechanixSectionListItemStyle merge(MechanixSectionListItemStyle? other) {
//     if (other == null) return this;

//     return MechanixSectionListItemStyle(
//       titleColor: other.titleColor ?? titleColor,
//       titleSize: other.titleSize ?? titleSize,
//       subTitleColor: other.subTitleColor ?? subTitleColor,
//       subTitleSize: other.subTitleSize ?? subTitleSize,
//     );
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(ColorProperty('titleColor', titleColor));
//     properties.add(DoubleProperty('titleSize', titleSize));
//     properties.add(DiagnosticsProperty('subTitleColor', subTitleColor));
//     properties.add(DiagnosticsProperty('subTitleSize', subTitleSize));
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//     return other is MechanixSectionListItemStyle &&
//         titleColor == other.titleColor &&
//         titleSize == other.titleSize &&
//         subTitleColor == other.subTitleColor &&
//         subTitleSize == other.subTitleSize;
//   }

//   @override
//   int get hashCode =>
//       Object.hash(titleColor, titleSize, subTitleColor, subTitleSize);
// }

// @immutable
// class MechanixSectionListItemTheme
//     extends ThemeExtension<MechanixSectionListItemTheme> {
//   const MechanixSectionListItemTheme({this.style});

//   final MechanixSectionListItemStyle? style;

//   @override
//   MechanixSectionListItemTheme copyWith({MechanixSectionListItemStyle? style}) {
//     return MechanixSectionListItemTheme(style: style ?? this.style);
//   }

//   @override
//   MechanixSectionListItemTheme lerp(
//       ThemeExtension<MechanixSectionListItemTheme>? other, double t) {
//     if (other is! MechanixSectionListItemTheme) return this;

//     return MechanixSectionListItemTheme(style: t < 0.5 ? style : other.style);
//   }

//   static MechanixSectionListItemStyle? of(BuildContext context) {
//     final theme = Theme.of(context).extension<MechanixSectionListItemTheme>();
//     return theme?.style;
//   }
// }
