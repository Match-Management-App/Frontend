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

  static BoxShadow defaultShadow = BoxShadow(
    color: MyColors.myBlack.withOpacity(0.7),
    blurRadius: 7,
    offset: const Offset(2, 3),
  );

  static LinearGradient tabBarGradient = LinearGradient(colors: [
    MyColors.myBlack,
    MyColors.myBlack,
    MyColors.myBlack,
    MyColors.myBlack,
    MyColors.myBlack,
    MyColors.myBlack,
    MyColors.myBlack,
    MyColors.myBlack.withOpacity(0.9),
    MyColors.myBlack.withOpacity(0.8),
    MyColors.myBlack.withOpacity(0.7),
    MyColors.myBlack.withOpacity(0.5),
    MyColors.myBlack.withOpacity(0.3),
    MyColors.myBlack.withOpacity(0.1),
    MyColors.myBlack.withOpacity(0.0),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static const TextStyle defaultText = TextStyle(
    color: MyColors.myWhite,
    fontSize: 18,
  );

  static BoxDecoration pipeDecoration = BoxDecoration(
    color: MyColors.primaryMint,
    borderRadius: BorderRadius.circular(20),
  );

  // Text
  static const TextStyle header3 = TextStyle(
    color: MyColors.myWhite,
    fontSize: 20,
  );
}
