import 'package:flutter/material.dart';
import 'package:widgets/mechanix.dart';
import 'package:widgets/widgets/listItems/mechanix_simple_list_theme.dart';
import 'package:widgets/widgets/listItems/simple_list_items_type.dart';

class MechanixSimpleList extends StatelessWidget {
  const MechanixSimpleList({
    super.key,
    this.isDividerRequired = true,
    this.divider,
    this.padding,
    this.physics,
    this.controller,
    required this.listItems,
  })  : itemBuilder = null,
        itemCount = null,
        separatorBuilder = null;

  const MechanixSimpleList.builder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.isDividerRequired = true,
    this.divider,
    this.padding,
    this.physics,
    this.controller,
  })  : listItems = const [],
        separatorBuilder = null;

  const MechanixSimpleList.separated({
    super.key,
    required this.listItems,
    required this.separatorBuilder,
    this.padding,
    this.physics,
    this.controller,
  })  : isDividerRequired = false,
        divider = null,
        itemBuilder = null,
        itemCount = null;

  final List<SimpleListItems> listItems;

  final bool isDividerRequired;

  final Widget? divider;

  final EdgeInsets? padding;

  final ScrollPhysics? physics;

  final ScrollController? controller;

  final int? itemCount;

  final Widget? Function(BuildContext, int)? itemBuilder;

  final Widget Function(BuildContext, int)? separatorBuilder;

  Widget _buildDefaultSeparator(BuildContext context, int index) {
    final theme = MechanixSimpleListTheme.of(context);

    if (divider != null) {
      return divider!;
    }
    return Divider(
      thickness: theme.dividerThickness,
      height: theme.dividerHeight,
      color: theme.dividerColor ?? Theme.of(context).dividerColor,
    );
  }

  Widget _buildListView({
    required MechanixSimpleListThemeData theme,
    required BuildContext context,
    required bool useSeparator,
    required bool themeRequiresDivider,
  }) {
    if (useSeparator) {
      return ListView.separated(
        shrinkWrap: true,
        physics: physics,
        controller: controller,
        itemCount: listItems.length,
        itemBuilder: itemBuilder ??
            (context, index) =>
                _buildListItem(context, listItems[index], theme),
        separatorBuilder: separatorBuilder!,
      );
    } else if (themeRequiresDivider) {
      return ListView.separated(
        shrinkWrap: true,
        physics: physics,
        controller: controller,
        itemCount: itemCount ?? listItems.length,
        itemBuilder: itemBuilder ??
            (context, index) =>
                _buildListItem(context, listItems[index], theme),
        separatorBuilder: _buildDefaultSeparator,
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: physics,
        controller: controller,
        itemCount: listItems.length,
        itemBuilder: itemBuilder ??
            (context, index) =>
                _buildListItem(context, listItems[index], theme),
      );
    }
  }

  Widget _buildListItem(BuildContext context, SimpleListItems item,
      MechanixSimpleListThemeData theme) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: item.onTap,
      onTapUp: item.onTapUp,
      onTapDown: item.onTapDown,
      onDoubleTap: item.onDoubleTap,
      child: Container(
        padding: theme.itemPadding,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (item.leading != null) item.leading!.padRight(),
                    Text(item.title, style: context.textTheme.labelMedium
                        // ?.merge(item.titleTextStyle),
                        )
                  ],
                ),
                if (item.trailing != null) item.trailing!,
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final itemTheme = MechanixSimpleListTheme.of(context);
    final bool useSeparator = separatorBuilder != null;
    final bool themeRequiresDivider = isDividerRequired && !useSeparator;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: itemTheme.widgetRadius,
          color: itemTheme.backgroundColor ?? context.colorScheme.secondary,
        ),
        child: _buildListView(
            theme: itemTheme,
            context: context,
            useSeparator: useSeparator,
            themeRequiresDivider: themeRequiresDivider),
      ),
    );
  }
}
