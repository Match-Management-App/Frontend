import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/HomeScreen/main_icon.dart';
import 'package:wanna_play_soccer/HomeScreen/my_app_bar.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MyAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // 배경색 설정
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              MyColors.myBlack,
              MyColors.gradientGrey,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.15, bottom: 10.0, left: 20.0, right: 20.0),
            child: const Center(
              child: Column(
                children: [
                  // 메인 아이콘
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 10.0),
                      MainIcon(title: '홈'),
                      MainIcon(title: '일정'),
                      MainIcon(title: '기록'),
                      SizedBox(width: 10.0),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
