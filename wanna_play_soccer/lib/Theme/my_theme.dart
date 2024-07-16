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
}
