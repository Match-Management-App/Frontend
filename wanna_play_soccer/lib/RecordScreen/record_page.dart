import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Component/subtitle.dart';
import 'package:wanna_play_soccer/RecordScreen/Widget/next_match_container.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: screenHeight * 0.14, bottom: 40, left: 30, right: 30),
        child: const Column(
          children: [
            NextMatchContainer(),
            Subtitle(icon: "🗳️", subtitle: "경기일 투표"),
            Subtitle(icon: "📆", subtitle: "경기 일정"),
          ],
        ),
      ),
    );
  }
}
