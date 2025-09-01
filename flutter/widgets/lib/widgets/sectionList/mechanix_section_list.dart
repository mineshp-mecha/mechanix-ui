import 'package:flutter/material.dart';
import 'package:widgets/mechanix.dart';
import 'package:widgets/widgets/sectionList/mechanix_section_list_theme.dart';
import 'package:widgets/widgets/sectionList/section_list_items_type.dart';

class MechanixSectionList extends StatelessWidget {
  const MechanixSectionList(
      {super.key,
      this.title,
      required this.sectionListItems,
      this.divider,
      this.dividerPadding = 16,
      this.titlePadding,
      this.splashColor,
      this.isDividerRequired = false});

  final String? title;

  final bool isDividerRequired;

  final double dividerPadding;

  final EdgeInsets? titlePadding;

  final Widget? divider;

  final Color? splashColor;

  final List<SectionListItemsType> sectionListItems;

  Widget _buildSectionList(
    BuildContext context,
    SectionListItemsType item,
  ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        onTapUp: item.onTapUp,
        onTapDown: item.onTapDown,
        onDoubleTap: item.onDoubleTap,
        splashColor: splashColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (item.leading != null) item.leading!.padRight(),
                    Text(
                      item.title,
                      style: context.textTheme.labelMedium
                          ?.merge(item.titleTextStyle),
                    )
                  ],
                ),
                if (item.trailing != null) item.trailing!,
              ],
            ).padAll(20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final listTheme = MechanixSectionListTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: titlePadding ?? Spacing.vertical(8),
            child: Text(
              title!,
              style: context.textTheme.labelMedium
                  ?.copyWith(color: context.colorScheme.surfaceDim)
                  .merge(listTheme.titleTextStyle),
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
                      _buildSectionList(context, sectionListItems[index]),
                  separatorBuilder: (BuildContext context, int index) {
                    if (divider != null) {
                      return divider!;
                    } else {
                      return Divider(
                        thickness: listTheme.dividerThickness,
                        height: listTheme.dividerHeight,
                      ).padHorizontal(dividerPadding);
                    }
                  },
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: sectionListItems.length,
                  itemBuilder: (context, index) =>
                      _buildSectionList(context, sectionListItems[index]),
                )
            ],
          ),
        ),
      ],
    );
  }
}
