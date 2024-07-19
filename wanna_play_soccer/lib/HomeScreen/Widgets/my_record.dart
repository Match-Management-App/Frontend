import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wanna_play_soccer/Theme/calendar.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

class Event {
  final String title;
  Event({required this.title});
}

class MyRecordWidget extends StatefulWidget {
  const MyRecordWidget({super.key});

  @override
  State<MyRecordWidget> createState() => _MyRecordWidgetState();
}

class _MyRecordWidgetState extends State<MyRecordWidget> {
  final List<Widget> _pages = [
    const MyRecordCalendar(),
    Container(
      margin: const EdgeInsets.all(20),
      color: MyColors.myWhite,
    ),
  ];

  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    // for infinite loop
    _controller = PageController(initialPage: 500);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget itemBuilder(BuildContext context, int index) {
    // for infinite loop
    return _pages[index % _pages.length];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        color: MyColors.widgetGrey,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [MyTheme.defaultShadow],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 320,
            child: PageView.builder(
              controller: _controller,
              itemBuilder: itemBuilder,
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: _pages.length,
            effect: const SlideEffect(
              dotWidth: 8,
              dotHeight: 8,
              activeDotColor: MyColors.primaryMint,
              dotColor: MyColors.widgetGrey,
            ),
          ),
        ],
      ),
    );
  }
}

class MyRecordCalendar extends StatefulWidget {
  const MyRecordCalendar({
    super.key,
  });

  @override
  State<MyRecordCalendar> createState() => _MyRecordCalendarState();
}

class _MyRecordCalendarState extends State<MyRecordCalendar> {
  static int getHashCode(DateTime key) {
    return key.day + key.month * 100 + key.year * 100;
  }
  // * 뭔가.. DateTime이 key일 때 이상한가..
  // eventDate 출력하면 2024-07-01 00:00:00.000Z 이거고
  // DateTime() 출력하면 2024-07-01 00:00:00.000 이라서 그런가..?
  // 암튼 저렇게 접근하면 event를 가져오지 못 함.
  // 그래서 해시코드를 저렇게 만들어 주니까 ㄱㅊ았음
  // TODO: API > month, event

  final _events = LinkedHashMap<DateTime, List<Event>>(
    equals: isSameDay,
    hashCode: getHashCode,
  )..addAll({
      DateTime(2024, 7, 4): [Event(title: "Event on July 4")],
      DateTime(2024, 7, 12): [Event(title: "Event on July 5")],
    });

  List<Event> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, bottom: 15, left: 25, right: 25),
      // color: MyColors.myBlack,
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
                final events = _getEventsForDay(day);
                return Container(
                  margin: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: events.isNotEmpty
                          ? CalendarTheme.selectedDays
                          : const BoxDecoration(),
                      child: Text(
                        '${day.day}',
                        style: CalendarTheme.defaultTextStyle,
                      )),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class Header3 extends StatelessWidget {
  const Header3({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 30,
          margin: const EdgeInsets.only(right: 10),
          decoration: MyTheme.pipeDecoration,
        ),
        Text(
          text,
          style: MyTheme.header3,
        ),
      ],
    );
  }
}
