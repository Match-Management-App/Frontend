import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

class NextMatchContainer extends StatelessWidget {
  const NextMatchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 40, bottom: 10),
      decoration: BoxDecoration(
        color: MyColors.primaryMint,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [MyTheme.defaultShadow],
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("📣", style: MyTheme.header2),
            Text(
              "다음 경기: 7월 31일",
              style: MyTheme.header3,
            ),
            Text("📣", style: MyTheme.header2),
          ],
        ),
      ),
    );
  }
}
