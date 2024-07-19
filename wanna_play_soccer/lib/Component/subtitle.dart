import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';

class Subtitle extends StatelessWidget {
  const Subtitle({
    super.key,
    required this.icon,
    required this.subtitle,
  });

  final String icon;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // color: MyColors.myDarkGrey,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            icon,
            style: Platform.isIOS
                ? const TextStyle(fontSize: 28)
                : const TextStyle(fontSize: 22),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 22,
              color: MyColors.myWhite,
            ),
          ),
        ],
      ),
    );
  }
}
