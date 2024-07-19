import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Component/subtitle.dart';
import 'package:wanna_play_soccer/HomeScreen/Widgets/next_match.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    Container(
      margin: const EdgeInsets.all(25),
      color: MyColors.primaryMint,
    ),
    Container(
      margin: const EdgeInsets.all(25),
      color: MyColors.myPointWhite,
    ),
  ];

  Widget itemBuilder(BuildContext context, int index) {
    return _pages[index % _pages.length];
  }

  final myRecordController = PageController(
    // keepPage: false,
    initialPage: 0,
  );

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
            const Subtitle(icon: "🏅", subtitle: "나의 기록"),
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: MyColors.widgetGrey,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [MyTheme.defaultShadow],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 270,
                    child: PageView.builder(
                      controller: myRecordController,
                      itemBuilder: itemBuilder,
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: myRecordController,
                    count: _pages.length,
                    effect: const SlideEffect(
                      dotWidth: 10,
                      dotHeight: 10,
                      activeDotColor: MyColors.primaryMint,
                      dotColor: MyColors.widgetGrey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Subtitle(icon: "👯", subtitle: "짝궁 찾기"),
          ],
        ),
      ),
    );
  }
}
