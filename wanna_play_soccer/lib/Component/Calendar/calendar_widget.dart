import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wanna_play_soccer/Component/Calendar/event.dart';
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
      decoration: MyTheme.widgetDecoration,
      child: Column(
        children: [
          MYCalendar(
            events: events,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

class MYCalendar extends StatefulWidget {
  const MYCalendar({
    super.key,
    required this.events,
    this.onPressed,
  });

  final Map<DateTime, List<Event>> events;
  final Function(DateTime)? onPressed;

  @override
  State<MYCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MYCalendar> {
  late DateTime _focusedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _firstDay = DateTime.utc(2024, 7, 1);
    _lastDay = DateTime.utc(2024, 12, 31);
  }

  List<Event> _getEventsForDay(DateTime day) {
    return widget.events[day] ?? [];
  }

  bool _isFirstMonth() {
    return _focusedDay.year == _firstDay.year &&
        _focusedDay.month == _firstDay.month;
  }

  bool _isLastMonth() {
    return _focusedDay.year == _lastDay.year &&
        _focusedDay.month == _lastDay.month;
  }

  @override
  Widget build(BuildContext context) {
    bool isWidgetVisible = widget.onPressed != null;
    double containerPadding = widget.onPressed == null ? 25 : 20;
    double headerPadding = widget.onPressed == null ? 10 : 0;

    return Container(
      margin: EdgeInsets.only(
          top: containerPadding, bottom: 25, left: 25, right: 25),
      child: Column(
        children: [
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: _firstDay,
            lastDay: _lastDay,
            daysOfWeekHeight: 30,
            rowHeight: 40,
            headerStyle: HeaderStyle(
              titleCentered: true,
              titleTextFormatter: (date, locale) => '${date.month}월',
              titleTextStyle: CalendarTheme.headerTextStyle,
              formatButtonVisible: false,
              headerPadding: EdgeInsets.symmetric(horizontal: headerPadding),
              headerMargin: EdgeInsets.only(bottom: headerPadding),
              leftChevronVisible: isWidgetVisible,
              rightChevronVisible: isWidgetVisible,
              leftChevronMargin: EdgeInsets.zero,
              rightChevronMargin: EdgeInsets.zero,
              leftChevronPadding: EdgeInsets.zero,
              rightChevronPadding: EdgeInsets.zero,
              leftChevronIcon: Icon(
                Icons.chevron_left,
                color: _isFirstMonth()
                    ? MyColors.myDarkGrey
                    : MyColors.primaryMint,
              ),
              rightChevronIcon: Icon(
                Icons.chevron_right,
                color:
                    _isLastMonth() ? MyColors.myDarkGrey : MyColors.primaryMint,
              ),
            ),
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
            },
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
                    onPressed: widget.onPressed != null
                        ? () => widget.onPressed!(day)
                        : null,
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
