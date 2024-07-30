import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Component/subtitle.dart';
import 'package:wanna_play_soccer/Pages/RecordScreen/Widget/hall_of_fame.dart';
import 'package:wanna_play_soccer/Pages/RecordScreen/Widget/record_chart.dart';
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
            // Container도 RecordChart 안에 넣고 싶었는데
            // RecordChart의 Expanded랑 SingleChildScrollView랑 충돌해서
            // RecordChart에 Container를 넣으면 에러 발생,,
            Container(
              height: 350,
              padding: const EdgeInsets.fromLTRB(20, 30, 40, 20),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: MyTheme.widgetDecoration,
              child: const RecordChart(),
            ),
            const Subtitle(icon: "👑", subtitle: "명예의 전당"),
            const HallOfFame(),
          ],
        ),
      ),
    );
  }
}
