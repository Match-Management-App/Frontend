import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';

class MyTheme {
  static const BoxDecoration backgroundColor = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        MyColors.myBlack,
        MyColors.gradientGrey,
      ],
    ),
  );

  static LinearGradient tabBarGradient = LinearGradient(colors: [
    MyColors.myBlack,
    MyColors.myBlack,
    MyColors.myBlack,
    MyColors.myBlack.withOpacity(0.9),
    MyColors.myBlack.withOpacity(0.7),
    MyColors.myBlack.withOpacity(0.5),
    MyColors.myBlack.withOpacity(0.2),
    MyColors.myBlack.withOpacity(0.0),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
}
