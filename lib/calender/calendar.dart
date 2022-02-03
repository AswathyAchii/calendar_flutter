import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'toggle_button.dart';
class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  bool togglevalue = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime(2022),
              lastDay: DateTime(2030),
              selectedDayPredicate: (day) {
                return isSameDay(selectedDay, day);
              },
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false, titleCentered: true),
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
                // ignore: avoid_print
                print(focusDay);
              },
              calendarStyle: const CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Color(0xffC51DA8),
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Color(0xff1F95AF),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [Text("Recurring",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)],
              ),
              Column(
                
                children: const [SwipeButton()],
              )
            ],
          ),
        )
      ],
    );
  }
}
