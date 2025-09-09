import 'package:flutter/material.dart';
import 'package:widgets/mechanix.dart';
import 'package:widgets/widgets/select/select_type.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  String selectValue = '';

  void onChanged(SelectOption option) {
    setState(() {
      selectValue = option.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Screen timeout',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 8),
        MechanixSelect(options: [
          SelectOption(value: 'Automatic', label: 'AUTOMATIC'),
          SelectOption(value: 'Static', label: 'STATIC')
        ], onChanged: onChanged, selectValue: selectValue)
      ],
    );
  }
}
