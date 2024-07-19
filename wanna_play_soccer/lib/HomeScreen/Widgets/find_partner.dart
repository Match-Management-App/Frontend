import "package:flutter/material.dart";
import "package:wanna_play_soccer/Theme/my_colors.dart";
import "package:wanna_play_soccer/Theme/my_theme.dart";

class FindPartner extends StatelessWidget {
  const FindPartner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primaryMint,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          print('hi');
        },
        child: const Text(
          "내 환상/환장의 짝궁은?",
          style: MyTheme.defaultText,
        ),
      ),
    );
  }
}
