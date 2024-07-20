import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

class Header3 extends StatelessWidget {
  const Header3({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 30,
          margin: const EdgeInsets.only(right: 10),
          decoration: MyTheme.pipeDecoration,
        ),
        Text(
          text,
          style: MyTheme.header3,
        ),
      ],
    );
  }
}
