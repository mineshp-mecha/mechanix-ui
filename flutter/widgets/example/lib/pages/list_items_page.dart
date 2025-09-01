import 'package:flutter/material.dart';
import 'package:widgets/mechanix.dart';

class MechanixListItemsPage extends StatefulWidget {
  const MechanixListItemsPage({super.key});

  @override
  State<MechanixListItemsPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MechanixListItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MechanixListItems(
          title: 'Network',
        ),
        MechanixListItems(
          title: 'Bluetooth',
          leading: Icon(Icons.bluetooth),
        ),
        MechanixListItems(
          title: 'Bluetooth',
          trailing: Icon(Icons.settings),
        )
      ],
    );
  }
}
