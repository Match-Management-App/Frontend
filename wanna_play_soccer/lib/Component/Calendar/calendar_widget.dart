import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wanna_play_soccer/Component/Calendar/event.dart';
import 'package:wanna_play_soccer/RecordScreen/Widget/header3.dart';
import 'package:wanna_play_soccer/Theme/calendar.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    super.key,
    required this.events,
    this.onPressed,
  });

  final LinkedHashMap<DateTime, List<Event>> events;
  final Function(DateTime)? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 320,
      decoration: MyTheme.widgetDecoration,
      child: Column(
        children: [
          AttendanceCalendar(
            events: events,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

class AttendanceCalendar extends StatelessWidget {
  const AttendanceCalendar({
    super.key,
    required this.events,
    this.onPressed,
  });

  final Map<DateTime, List<Event>> events;
  final Function(DateTime)? onPressed;

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, bottom: 15, left: 25, right: 25),
      child: Column(
        children: [
          const Header3(text: "7월"),
          const SizedBox(height: 20),
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2024, 7, 1),
            lastDay: DateTime.utc(2024, 7, 31),
            daysOfWeekHeight: 30,
            rowHeight: 40,
            headerVisible: false,
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: CalendarTheme.daysOfWeekStyle,
              weekendStyle: CalendarTheme.daysOfWeekStyle,
            ),
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              cellMargin: const EdgeInsets.all(4),
              todayDecoration: CalendarTheme.today,
              selectedDecoration: CalendarTheme.selectedDays,
              weekendTextStyle: CalendarTheme.defaultTextStyle,
              defaultTextStyle: CalendarTheme.defaultTextStyle,
            ),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                final dayEvents = _getEventsForDay(day);
                return Container(
                  margin: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: onPressed != null ? () => onPressed!(day) : null,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: const CircleBorder(),
                      backgroundColor: dayEvents.isNotEmpty
                          ? MyColors.primaryMint
                          : Colors.transparent,
                    ),
                    child: Text(
                      '${day.day}',
                      style: CalendarTheme.defaultTextStyle,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
