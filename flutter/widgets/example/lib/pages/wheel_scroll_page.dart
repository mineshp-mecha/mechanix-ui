import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class WheelScrollPage extends StatefulWidget {
  const WheelScrollPage({super.key});

  @override
  State<WheelScrollPage> createState() => _WheelScrollPageState();
}

class _WheelScrollPageState extends State<WheelScrollPage> {
  int selectedMonth = 0;
  int selectedYear = 0;
  int selectedWeekDay = 0;
  int selectedDay = 0;

  @override
  Widget build(BuildContext context) {
    List<String> totalDays = getDaysInMonth(
      years[selectedYear],
      selectedMonth + 1, // because months list is 0-indexed
    ).map((d) => d.toString()).toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // CustomTrailingText(
              //     title:
              //         '${totalDays[day]} ${months[month]} ${years[year]}, ${weekDays[weekday]}'),
              Text(
                  '${totalDays[selectedDay]} ${months[selectedMonth]} ${years[selectedYear]}, ${weekDays[selectedWeekDay]}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      MechanixWheelScroll(
                        width: 110,
                        height: 200,
                        value: selectedDay,
                        options: totalDays,
                        onSelectedItemChanged: (index) {
                          setState(() {
                            selectedDay = index;
                          });
                        },
                      ),
                      MechanixWheelScroll(
                        width: 110,
                        height: 200,
                        value: selectedMonth,
                        options: months,
                        onSelectedItemChanged: (index) {
                          setState(() {
                            selectedMonth = index;
                            // Reset day if out of range
                            if (selectedDay >=
                                getDaysInMonth(years[selectedYear], index + 1)
                                    .length) {
                              selectedDay =
                                  getDaysInMonth(years[selectedYear], index + 1)
                                          .length -
                                      1;
                            }
                          });
                        },
                      ),

                      // Year wheel (1975..now+10)
                      MechanixWheelScroll(
                        width: 110,
                        height: 200,
                        value: selectedYear,
                        options: years.map((y) => y.toString()).toList(),
                        onSelectedItemChanged: (index) {
                          setState(() {
                            selectedYear = index;
                            // Reset day if out of range
                            if (selectedDay >=
                                getDaysInMonth(years[index], selectedMonth + 1)
                                    .length) {
                              selectedDay = getDaysInMonth(
                                          years[index], selectedMonth + 1)
                                      .length -
                                  1;
                            }
                          });
                        },
                      ),
                    ],
                  ),

                  // Weekday wheel (Mon..Sun)
                  MechanixWheelScroll(
                    width: 110,
                    height: 200,
                    value: selectedWeekDay,
                    options: weekDays,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedWeekDay = index;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<String> months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

final List<int> years = List.generate(
  DateTime.now().year - 1975 + 1,
  (i) => 1975 + i,
);

final List<String> weekDays = [
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
];

bool isLeapYear(int year) {
  return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
}

List<int> getDaysInMonth(int year, int month) {
  if (month == 2) {
    return List.generate(isLeapYear(year) ? 29 : 28, (i) => i + 1);
  } else if ([4, 6, 9, 11].contains(month)) {
    return List.generate(30, (i) => i + 1);
  } else {
    return List.generate(31, (i) => i + 1);
  }
}
