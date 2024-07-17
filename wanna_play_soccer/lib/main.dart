import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/HomeScreen/main_screen.dart';
import 'package:wanna_play_soccer/HomeScreen/main_screen2.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '⚽️ Wanna Play Soccer? ⚽️',
      theme: ThemeData(
        primaryColor: MyColors.myBlack,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: MyColors.primaryMint,
        ),
        fontFamily: 'Pretendard',
      ),
      home: const HomeScreen2(),
    );
  }
}
