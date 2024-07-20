import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

class PartnerRank extends StatelessWidget {
  const PartnerRank({
    super.key,
    required this.first,
    required this.second,
    required this.third,
  });

  final String first;
  final String second;
  final String third;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(20),
      decoration: MyTheme.widgetDecoration,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "🥇",
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  first,
                  style: MyTheme.header3,
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "🥈 $second",
                  style: MyTheme.defaultText,
                ),
                Text(
                  "🥉 $third",
                  style: MyTheme.defaultText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
