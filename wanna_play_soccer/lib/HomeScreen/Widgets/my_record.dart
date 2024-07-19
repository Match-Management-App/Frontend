import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

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

class MyRecordCalendar extends StatelessWidget {
  const MyRecordCalendar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      // color: MyColors.myBlack,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 3,
                height: 30,
                margin: const EdgeInsets.only(right: 10),
                decoration: MyTheme.pipeDecoration,
              ),
              const Text(
                "7월",
                style: TextStyle(
                  color: MyColors.myWhite,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2024, 7, 1),
            lastDay: DateTime.utc(2024, 7, 31),
            daysOfWeekHeight: 30,
            rowHeight: 40,
            headerVisible: false,
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                color: MyColors.myGrey,
                fontSize: 12,
              ),
              weekendStyle: TextStyle(
                color: MyColors.myGrey,
                fontSize: 12,
              ),
            ),
            calendarStyle: const CalendarStyle(
              // isTodayHighlighted: false,
              outsideDaysVisible: false,
              selectedDecoration: BoxDecoration(
                color: MyColors.primaryMint,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: MyColors.primaryMint,
                shape: BoxShape.circle,
              ),
              weekendTextStyle: TextStyle(
                color: MyColors.myWhite,
                fontSize: 16,
              ),
              defaultTextStyle: TextStyle(
                color: MyColors.myWhite,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
