import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Component/subtitle.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';

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
        child: Column(
          children: [
            const Subtitle(icon: "📆", subtitle: "다음 경기"),
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: MyColors.widgetGrey,
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            const SizedBox(height: 15),
            const Subtitle(icon: "🏅", subtitle: "나의 기록"),
            const SizedBox(height: 15),
            const Subtitle(icon: "👯", subtitle: "짝궁 찾기"),
          ],
        ),
      ),
    );
  }
}
