import 'package:flutter/material.dart';
import 'package:widgets/mechanix.dart';

class NavigationSecondPage extends StatelessWidget {
  const NavigationSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MechanixNavigationBar(
          titleText: "Back ",
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Back to Home Page")),
        ));
  }
}
