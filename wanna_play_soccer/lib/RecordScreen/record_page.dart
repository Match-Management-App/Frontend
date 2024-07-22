import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wanna_play_soccer/Component/Calendar/event.dart';
import 'package:wanna_play_soccer/Component/subtitle.dart';
import 'package:wanna_play_soccer/Component/Calendar/calendar_widget.dart';
import 'package:wanna_play_soccer/RecordScreen/Widget/next_match_container.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  DateTime? selectedDate;
  bool isCalendarClicked = false;

  void onPressed(DateTime date) {
    setState(() {
      if (_events[date]?.isNotEmpty ?? false) {
        isCalendarClicked = true;
        selectedDate = (selectedDate == date) ? null : date;
      } else {
        selectedDate = null;
      }
    });
    // print("onPressed: $date");
  }

  static int getHashCode(DateTime key) {
    return key.day + key.month * 100 + key.year * 100;
  }

  final _events = LinkedHashMap<DateTime, List<Event>>(
    equals: isSameDay,
    hashCode: getHashCode,
  )..addAll({
      DateTime(2024, 7, 4): [Event(title: "Event on July 4")],
      DateTime(2024, 7, 12): [Event(title: "Event on July 12")],
    });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: screenHeight * 0.14, bottom: 40, left: 30, right: 30),
        child: Column(
          children: [
            const NextMatchContainer(),
            const Subtitle(icon: "🗳️", subtitle: "경기일 투표"),
            const Subtitle(icon: "📆", subtitle: "경기 일정"),
            CalendarWidget(
              events: _events,
              onPressed: onPressed,
            ),
            if (isCalendarClicked) ...[
              if (selectedDate != null)
                CommentSection(date: selectedDate!)
              else
                const DefaultSection()
            ]
          ],
        ),
      ),
    );
  }
}

class CommentSection extends StatelessWidget {
  final DateTime date;

  const CommentSection({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 320,
      decoration: MyTheme.widgetDecoration,
    );
  }
}

class DefaultSection extends StatelessWidget {
  const DefaultSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(top: 30),
      width: double.infinity,
      height: 320,
      child: const Text(
        "예정된 경기가 없습니다.",
        style: TextStyle(
          fontSize: 14,
          color: MyColors.myGrey,
        ),
      ),
    );
  }
}
