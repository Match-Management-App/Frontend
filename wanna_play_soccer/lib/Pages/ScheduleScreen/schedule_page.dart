import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wanna_play_soccer/Component/Calendar/event.dart';
import 'package:wanna_play_soccer/Component/subtitle.dart';
import 'package:wanna_play_soccer/Component/Calendar/calendar_widget.dart';
import 'package:wanna_play_soccer/Pages/ScheduleScreen/Widget/comment_of_no_match.dart';
import 'package:wanna_play_soccer/Pages/ScheduleScreen/Widget/comments.dart';
import 'package:wanna_play_soccer/Pages/ScheduleScreen/Widget/next_match_container.dart';
import 'package:wanna_play_soccer/Pages/ScheduleScreen/Widget/vote.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  DateTime? selectedDate;
  bool isNonMatchDayClicked = false;
  bool isVoteResultOpened = false;
  String resultDate = '';

  void onTap(String date) {
    setState(() {
      isVoteResultOpened = !isVoteResultOpened;
      resultDate = date;
      print(date);
    });
  }

  void onPressed(DateTime date) {
    setState(() {
      if (_events[date]?.isNotEmpty ?? false) {
        isNonMatchDayClicked = false;
        selectedDate = (selectedDate == date) ? null : date;
      } else {
        selectedDate = null;
        isNonMatchDayClicked = !isNonMatchDayClicked;
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
      DateTime(2024, 8, 12): [Event(title: "Event on July 12")],
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
            VoteWidget(onTap: onTap),
            if (isVoteResultOpened) const VoteResult(),
            const SizedBox(height: 20),
            const Subtitle(icon: "📆", subtitle: "경기 일정"),
            CalendarWidget(
              events: _events,
              onPressed: onPressed,
            ),
            if (selectedDate != null)
              CommentSection(date: selectedDate!)
            else if (isNonMatchDayClicked)
              const DefaultSection()
          ],
        ),
      ),
    );
  }
}

class VoteResult extends StatelessWidget {
  const VoteResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 10, 10),
          child: Row(
            children: [
              Container(
                width: 3,
                height: 20,
                margin: const EdgeInsets.only(right: 10),
                decoration: MyTheme.pipeDecoration,
              ),
              const Text('투표 결과', style: MyTheme.header3),
            ],
          ),
        ),
        Container(
          height: 300,
          margin: const EdgeInsets.only(bottom: 20),
          decoration: MyTheme.widgetDecoration,
        ),
      ],
    );
  }
}
