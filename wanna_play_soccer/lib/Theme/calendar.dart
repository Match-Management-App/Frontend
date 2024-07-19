import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';

class CalendarTheme {
  static const TextStyle daysOfWeekStyle = TextStyle(
    color: MyColors.myGrey,
    fontSize: 12,
  );

  static const BoxDecoration selectedDays = BoxDecoration(
    color: MyColors.primaryMint,
    shape: BoxShape.circle,
  );

  static BoxDecoration today = BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(
      color: MyColors.primaryMint,
      width: 1.4,
    ),
  );

  static const TextStyle defaultTextStyle = TextStyle(
    color: MyColors.myWhite,
    fontSize: 16,
  );
}
