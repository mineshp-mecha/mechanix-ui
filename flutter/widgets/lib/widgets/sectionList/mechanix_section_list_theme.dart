import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class MechanixSectionListThemeData
    extends ThemeExtension<MechanixSectionListThemeData> with Diagnosticable {
  const MechanixSectionListThemeData({
    this.backgroundColor,
    this.titleTextStyle,
  });

  final WidgetStateProperty<Color?>? backgroundColor;
  final TextStyle? titleTextStyle;

  @override
  MechanixSectionListThemeData copyWith(
      {WidgetStateProperty<Color?>? backgroundColor,
      TextStyle? titleTextStyle}) {
    return MechanixSectionListThemeData(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        titleTextStyle: titleTextStyle ?? this.titleTextStyle);
  }

  @override
  ThemeExtension<MechanixSectionListThemeData> lerp(
      ThemeExtension<MechanixSectionListThemeData>? other, double t) {
    final o = other as MechanixSectionListThemeData?;
    return MechanixSectionListThemeData(
        backgroundColor: WidgetStateProperty.lerp<Color?>(
            backgroundColor, o?.backgroundColor, t, Color.lerp),
        titleTextStyle: TextStyle.lerp(titleTextStyle, o?.titleTextStyle, t));
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

// // Example usage with helper methods for common states
// extension MechanixSectionListThemeDataExtension
//     on MechanixSectionListThemeData {
//   // Helper methods for common widget states
//   TextStyle get defaultTextStyle => getTextStyle({});
//   TextStyle get hoveredTextStyle => getTextStyle({WidgetState.hovered});
//   TextStyle get pressedTextStyle => getTextStyle({WidgetState.pressed});
//   TextStyle get disabledTextStyle => getTextStyle({WidgetState.disabled});
//   TextStyle get selectedTextStyle => getTextStyle({WidgetState.selected});
// }

// // Example widget using the theme
// class MechanixSectionListItem extends StatefulWidget {
//   const MechanixSectionListItem({
//     super.key,
//     required this.title,
//     this.subtitle,
//     this.onTap,
//     this.isSelected = false,
//   });

//   final String title;
//   final String? subtitle;
//   final VoidCallback? onTap;
//   final bool isSelected;

//   @override
//   State<MechanixSectionListItem> createState() =>
//       _MechanixSectionListItemState();
// }

// class _MechanixSectionListItemState extends State<MechanixSectionListItem> {
//   bool _isHovered = false;
//   bool _isPressed = false;

//   Set<WidgetState> get _states {
//     return {
//       if (widget.isSelected) WidgetState.selected,
//       if (_isHovered) WidgetState.hovered,
//       if (_isPressed) WidgetState.pressed,
//       if (widget.onTap == null) WidgetState.disabled,
//     };
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = MechanixSectionListTheme.of(context);
//     final textStyle = theme.getTextStyle(_states);

//     return GestureDetector(
//       onTap: widget.onTap,
//       onTapDown: (_) => setState(() => _isPressed = true),
//       onTapUp: (_) => setState(() => _isPressed = false),
//       onTapCancel: () => setState(() => _isPressed = false),
//       child: MouseRegion(
//         onEnter: (_) => setState(() => _isHovered = true),
//         onExit: (_) => setState(() => _isHovered = false),
//         child: Container(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 widget.title,
//                 style: textStyle,
//               ),
//               if (widget.subtitle != null)
//                 Text(
//                   widget.subtitle!,
//                   style: textStyle.copyWith(
//                     fontSize: (textStyle.fontSize ?? 14) * 0.8,
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
