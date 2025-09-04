import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:widgets_example/pages/alerts_page.dart';
import 'package:widgets_example/pages/buttons_page.dart';
import 'package:widgets_example/pages/list_page.dart';
import 'package:widgets_example/pages/menu_page.dart';
import 'package:widgets_example/pages/navigation_page.dart';

import 'pages/checkbox_page.dart';

class PageItem {
  const PageItem({
    required this.title,
    this.leadingBuilder,
    this.titleBuilder,
    this.actionsBuilder,
    required this.pageBuilder,
    required this.iconBuilder,
    this.floatingActionButtonBuilder,
  });

  final String title;
  final WidgetBuilder? leadingBuilder;
  final WidgetBuilder? titleBuilder;
  final List<Widget> Function(BuildContext context)? actionsBuilder;
  final WidgetBuilder pageBuilder;
  final WidgetBuilder? floatingActionButtonBuilder;
  final Widget Function(BuildContext context, bool selected) iconBuilder;
}

final examplePageItems = <PageItem>[
  PageItem(
    title: 'MechanixCheckbox',
    pageBuilder: (context) => const CheckboxPage(),
    iconBuilder: (context, selected) => selected
        ? const Icon(Icons.check_box)
        : const Icon(Icons.check_box_outline_blank),
  ),
  PageItem(
      title: 'MechanixButton',
      //   floatingActionButtonBuilder: (_) => const CodeSnippedButton( //TODO: Code Snippet Button
      //   snippetUrl:
      //       'https://raw.githubusercontent.com/ubuntu/yaru.dart/main/example/lib/pages/autocomplete_page.dart',
      // ),
      pageBuilder: (context) => const ButtonsPage(),
      iconBuilder: (context, selected) =>
          const Icon(Icons.radio_button_checked)),
  PageItem(
    title: 'MechanixAlerts',
    pageBuilder: (context) => const AlertsPage(),
    iconBuilder: (context, selected) => const Icon(Icons.smart_screen_rounded),
  ),
  PageItem(
      title: 'MechanixSettingsMenu',
      pageBuilder: (context) => const MechanixSettingsMenuPage(),
      iconBuilder: (context, selected) =>
          const Icon(Icons.smart_screen_rounded)),
  PageItem(
      title: 'Mechanix Navigation Bar',
      pageBuilder: (context) => const NavigationPage(),
      iconBuilder: (context, selected) =>
          const Icon(Icons.smart_screen_rounded)),
  PageItem(
      title: 'Mechanix Pressable List',
      pageBuilder: (context) => const MechanixList(),
      iconBuilder: (context, selected) =>
          const Icon(Icons.smart_screen_rounded)),
].sortedBy((page) => page.title);
