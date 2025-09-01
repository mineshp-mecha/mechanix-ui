import 'package:flutter/material.dart';
import 'package:widgets/mechanix.dart';
import 'package:widgets/widgets/sectionList/mechanix_section_list_items.dart';
import 'package:widgets/widgets/sectionList/mechanix_section_list_theme.dart';
import 'package:widgets/widgets/sectionList/section_list_type.dart';

class MechanixSectionList extends StatelessWidget {
  const MechanixSectionList(
      {super.key,
      this.title,
      required this.sectionListItems,
      // this.backgroundColor,
      this.titleTextStyle,
      this.dividerThickness = 1,
      this.dividerHeight = 1,
      this.dividerColor,
      this.divider,
      this.dividerPadding = 16,
      this.titlePadding,
      this.isDividerRequired = false});

  final String? title;

  // final Color?
  // ;

  final TextStyle? titleTextStyle;

  final double dividerThickness;

  final double dividerHeight;

  final Color? dividerColor;

  final bool isDividerRequired;

  final double dividerPadding;

  final EdgeInsets? titlePadding;

  final Widget? divider;

  final List<SectionListItemsType> sectionListItems;

  Widget _buildSectionList(
    SectionListItemsType item,
  ) {
    return MechanixSectionListItems(
      leading: item.leading,
      trailing: item.trailing,
      title: item.title,
      subTitle: item.subTitle,
      titleTextStyle: item.titleTextStyle,
      subTitleTextStyle: item.subTitleTextStyle,
      onTap: item.onTap,
      onTapUp: item.onTapUp,
      onTapDown: item.onTapDown,
      onDoubleTap: item.onDoubleTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final listTheme = MechanixSectionListTheme.of(context);

    print(listTheme.toString());

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: titlePadding ?? Spacing.bottom(8),
              child: Text(
                title!,
                style: context.textTheme.labelMedium
                    ?.copyWith(color: context.colorScheme.surfaceDim)
                    .merge(titleTextStyle ?? listTheme.titleTextStyle),
              ),
            ),
          Container(
            decoration: BoxDecoration(
              borderRadius: CircularRadius.md,
              color: listTheme.backgroundColor?.resolve({}) ??
                  context.colorScheme.secondary,
            ),
            child: Column(
              children: [
                if (isDividerRequired)
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: sectionListItems.length,
                    itemBuilder: (context, index) =>
                        _buildSectionList(sectionListItems[index]),
                    separatorBuilder: (BuildContext context, int index) {
                      if (divider != null) {
                        return divider!;
                      } else {
                        return Divider(
                          thickness: dividerThickness,
                          height: dividerHeight,
                        ).padHorizontal(dividerPadding);
                      }
                    },
                  )
                else
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: sectionListItems.length,
                    itemBuilder: (context, index) =>
                        _buildSectionList(sectionListItems[index]),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
