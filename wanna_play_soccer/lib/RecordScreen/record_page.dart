import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Component/subtitle.dart';
import 'package:wanna_play_soccer/FindPartner/Widget/partner_rank.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

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
      child: Padding(
        padding: EdgeInsets.only(
            top: screenHeight * 0.14, bottom: 40, left: 30, right: 30),
        child: Column(
          children: [
            const Subtitle(icon: "📊", subtitle: "나의 기록"),
            const Subtitle(icon: "👑", subtitle: "명예의 전당"),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              width: double.infinity,
              height: 200,
              padding: const EdgeInsets.all(20),
              decoration: MyTheme.widgetDecoration,
              child: const Ranking(
                  first: "first",
                  second: "seconddddddddddddddddd",
                  third: "third"),
            ),
          ],
        ),
      ),
    );
  }
}
