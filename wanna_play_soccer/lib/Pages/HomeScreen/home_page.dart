import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wanna_play_soccer/Component/Calendar/event.dart';
import 'package:wanna_play_soccer/Component/subtitle.dart';
import 'package:wanna_play_soccer/Pages/HomeScreen/Widgets/find_partner_button.dart';
import 'package:wanna_play_soccer/Component/Calendar/calendar_widget.dart';
import 'package:wanna_play_soccer/Pages/HomeScreen/Widgets/next_match.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            const Subtitle(icon: "📆", subtitle: "다음 경기"),
            const NextMatch(),
            const SizedBox(height: 15),
            const Subtitle(icon: "⚽️", subtitle: "출석 현황"),
            CalendarWidget(
              events: _events,
              onPressed: null,
            ),
            const SizedBox(height: 15),
            const Subtitle(icon: "👯", subtitle: "짝궁 찾기"),
            const FindPartnerButton(),
          ],
        ),
      ),
    );
  }
}
