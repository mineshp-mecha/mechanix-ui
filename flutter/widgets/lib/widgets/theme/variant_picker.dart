import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';
import 'package:widgets/mechanix.dart';

class VariantPicker extends StatelessWidget with WatchItMixin{
  const VariantPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final model = di<ThemeToggle>();
    // final mechanixVariant =
    //     watchPropertyValue((ThemeToggle t) => (t.mechanixVariant));

    return PopupMenuButton(
      icon: Icon(Icons.colorize),
      tooltip: 'Pick A Variant',
      itemBuilder: (context) {
        return [
          for (final variant in MechanixVariant.values)
            PopupMenuItem(
              onTap: () => model.setThemeVariant(variant),
              child: Text(variant.name),
            )
        ];
      },
    );
  }
}
