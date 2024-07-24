import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Component/subtitle.dart';

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
        child: const Column(
          children: [
            Subtitle(icon: "📊", subtitle: "나의 기록"),
            Subtitle(icon: "👑", subtitle: "명예의 전당"),
          ],
        ),
      ),
    );
  }
}
