import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Component/subtitle.dart';
import 'package:wanna_play_soccer/HomeScreen/Component/next_match.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

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
            Subtitle(icon: "🏅", subtitle: "나의 기록"),
            SizedBox(height: 15),
            Subtitle(icon: "👯", subtitle: "짝궁 찾기"),
          ],
        ),
      ),
    );
  }
}
