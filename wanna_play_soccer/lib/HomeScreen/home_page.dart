import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Component/subtitle.dart';
import 'package:wanna_play_soccer/HomeScreen/Widgets/find_partner_button.dart';
import 'package:wanna_play_soccer/HomeScreen/Widgets/attendance.dart';
import 'package:wanna_play_soccer/HomeScreen/Widgets/next_match.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: screenHeight * 0.14, bottom: 40, left: 30, right: 30),
        child: const Column(
          children: [
            Subtitle(icon: "📆", subtitle: "다음 경기"),
            NextMatch(),
            SizedBox(height: 15),
            Subtitle(icon: "⚽️", subtitle: "출석 현황"),
            Attendance(),
            SizedBox(height: 15),
            Subtitle(icon: "👯", subtitle: "짝궁 찾기"),
            FindPartnerButton(),
          ],
        ),
      ),
    );
  }
}
