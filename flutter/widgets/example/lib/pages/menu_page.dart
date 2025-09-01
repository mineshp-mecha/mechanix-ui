import 'package:flutter/material.dart';
import 'package:widgets/mechanix.dart';
import 'package:widgets/widgets/sectionList/section_list_type.dart';

class MechanixSettingsMenuPage extends StatefulWidget {
  const MechanixSettingsMenuPage({super.key});

  @override
  State<MechanixSettingsMenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MechanixSettingsMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MechanixSectionList(
            title: 'Connectivity',
            isDividerRequired: true,
            sectionListItems: [
              SectionListItemsType(
                  title: 'Network',
                  leading: SizedBox(
                      height: 24,
                      width: 24,
                      child: Icon(
                        Icons.wifi,
                        size: 24,
                      )),
                  trailing: SizedBox(
                      height: 24,
                      width: 24,
                      child: Icon(
                        Icons.arrow_right,
                        size: 24,
                      ))),
              SectionListItemsType(
                title: 'Mobile Data',
                leading: SizedBox(
                    height: 24,
                    width: 24,
                    child: Icon(
                      Icons.network_cell,
                      size: 24,
                    )),
              ),
              SectionListItemsType(
                  title: 'Bluetooth',
                  trailing: SizedBox(
                      height: 24,
                      width: 24,
                      child: Icon(
                        Icons.arrow_right,
                        size: 24,
                      ))),
            ]),
      ],
    );
  }
}
