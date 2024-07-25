import "dart:io";

import "package:flutter/material.dart";
import "package:wanna_play_soccer/Theme/my_colors.dart";
import "package:wanna_play_soccer/Theme/my_theme.dart";

class NextMatch extends StatelessWidget {
  const NextMatch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: MyTheme.widgetDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 80,
            width: 5,
            margin: const EdgeInsets.only(left: 10),
            decoration: MyTheme.pipeDecoration,
          ),
          Container(
            width: 85,
            margin: Platform.isIOS ? const EdgeInsets.only(right: 10) : null,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "07/30",
                  style: TextStyle(
                    color: MyColors.myWhite,
                    fontSize: 30,
                  ),
                ),
                Text(
                  "Saturday",
                  style: MyTheme.defaultText,
                ),
              ],
            ),
          ),
          const VerticalDivider(
            color: MyColors.myGrey,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Container(
            width: 120,
            margin: Platform.isIOS ? const EdgeInsets.only(right: 15) : null,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "장소: ~~~",
                  style: MyTheme.defaultText,
                ),
                SizedBox(height: 5),
                Text(
                  "인원: ~~~",
                  style: MyTheme.defaultText,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
