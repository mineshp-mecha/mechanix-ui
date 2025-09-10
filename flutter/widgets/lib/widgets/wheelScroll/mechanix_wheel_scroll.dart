import 'package:flutter/material.dart';
import 'package:widgets/extensions/theme_extension.dart';
import 'package:widgets/mechanix.dart';
import 'package:widgets/widgets/wheelScroll/mechanix_wheel_scroll_theme.dart';

class MechanixWheelScroll extends StatefulWidget {
  const MechanixWheelScroll({
    super.key,
    this.width, // Added width parameter for Row/Column flexibility
    this.height = 200,
    this.selectionHeight = 50,
    this.selectionWidth = 80,
    this.useMagnifier = true,
    this.offAxisFraction = 0,
    this.itemExtent = 40,
    this.squeeze = 1,
    this.theme,
    this.scrollEnabled = true,
    this.isLoop = true,
    required this.value,
    required this.options,
    required this.onSelectedItemChanged,
  });

  final double? width; // New parameter
  final double? height;
  final double? selectionHeight;
  final double? selectionWidth;
  final bool useMagnifier;
  final bool isLoop;
  final bool scrollEnabled;
  final double squeeze;
  final double itemExtent;
  final double offAxisFraction;
  final MechanixWheelScrollThemeData? theme;
  final List<String> options;
  final int value;
  final void Function(int index)? onSelectedItemChanged;

  @override
  State<MechanixWheelScroll> createState() => _MechanixWheelScrollState();
}

class _MechanixWheelScrollState extends State<MechanixWheelScroll> {
  final FixedExtentScrollController _controller = FixedExtentScrollController();
  int? _previousValue;

  @override
  void initState() {
    super.initState();
    _previousValue = widget.value;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_controller.hasClients) {
        _controller.jumpToItem(widget.value);
      }
    });
  }

  @override
  void didUpdateWidget(MechanixWheelScroll oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value && _controller.hasClients) {
      _previousValue = widget.value;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_controller.hasClients && _previousValue == widget.value) {
          _controller.jumpToItem(widget.value);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final clockTheme = MechanixWheelScrollTheme.of(context).merge(widget.theme);

    return SizedBox(
      width: widget.width, // Use the width parameter
      height: widget.height,
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: clockTheme.selectionPadding,
              child: Container(
                height: widget.selectionHeight,
                width: widget.selectionWidth,
                decoration: BoxDecoration(
                  color: clockTheme.selectionColor ??
                      context.colorScheme.secondary,
                  borderRadius: clockTheme.selectionBorderRadius,
                ),
              ),
            ),
          ),
          ListWheelScrollView.useDelegate(
              controller: _controller,
              itemExtent: widget.itemExtent,
              squeeze: widget.squeeze,
              useMagnifier: widget.useMagnifier,
              offAxisFraction: widget.offAxisFraction,
              // onSelectedItemChanged: widget.onSelectedItemChanged,
              scrollBehavior: widget.scrollEnabled
                  ? null
                  : const ScrollBehavior().copyWith(
                      scrollbars: false), // Disable scrollbars when disabled
              physics: widget.scrollEnabled
                  ? const FixedExtentScrollPhysics()
                  : const NeverScrollableScrollPhysics(), // This disables scrolling
              onSelectedItemChanged: widget.scrollEnabled
                  ? widget.onSelectedItemChanged
                  : null, // Disable callback when scrolling is disabled
              childDelegate: widget.isLoop
                  ? ListWheelChildLoopingListDelegate(
                      children: List.generate(widget.options.length, (index) {
                        final isSelected = index == widget.value;
                        return Center(
                          child: Text(
                            widget.options[index],
                            style: isSelected
                                ? clockTheme.selectedTextStyle
                                    ?.copyWith(color: Colors.white)
                                : clockTheme.notSelectedTextStyle?.copyWith(
                                    color: context.colorScheme.secondary),
                          ),
                        );
                      }),
                    )
                  : ListWheelChildListDelegate(
                      // Changed from Looping to regular List
                      children: List.generate(widget.options.length, (index) {
                      final isSelected = index == widget.value;
                      return Center(
                        child: Text(
                          widget.options[index],
                          style: isSelected
                              ? clockTheme.selectedTextStyle
                                  ?.copyWith(color: Colors.white)
                              : clockTheme.notSelectedTextStyle?.copyWith(
                                  color: context.colorScheme.secondary),
                        ),
                      );
                    }))),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
