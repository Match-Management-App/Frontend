import "package:flutter/material.dart";
import "package:wanna_play_soccer/Theme/my_colors.dart";

class DefaultSection extends StatelessWidget {
  const DefaultSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(top: 30),
      width: double.infinity,
      height: 320,
      child: const Text(
        "예정된 경기가 없습니다.",
        style: TextStyle(
          fontSize: 14,
          color: MyColors.myGrey,
        ),
      ),
    );
  }
}
