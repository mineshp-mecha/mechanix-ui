import 'package:flutter/material.dart';
import 'package:widgets/mechanix.dart';
// import 'package:widgets/widgets/switch/mechanix_switch_theme.dart';
import 'package:widgets_example/example.dart';
import 'package:watch_it/watch_it.dart';

void main() {
  di.registerSingleton(ThemeToggle());
  runApp(const MechanixApp());
}

class MechanixApp extends StatelessWidget with WatchItMixin {
  const MechanixApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = watchPropertyValue((ThemeToggle t) => t.themeMode);
    final mechanixVariant =
        watchPropertyValue((ThemeToggle t) => t.mechanixVariant);

    return MechanixTheme(
      data: MechanixThemeData(mechanixVariant: mechanixVariant),
      builder: (context, mechanix, child) => _MechanixApp(
        darkTheme: mechanix.darkTheme,
        lightTheme: mechanix.lightTheme,
        themeMode: themeMode,
      ),
    );
  }
}

class _MechanixApp extends StatelessWidget {
  const _MechanixApp({
    required this.lightTheme,
    required this.darkTheme,
    required this.themeMode,
  });

  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: Scaffold(
        body: const Example(),
      ),
    );
  }
}
