import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

class MyTab extends StatefulWidget {
  const MyTab({
    super.key,
    required this.text,
    required this.isSelected,
  });

  final String text;
  final bool isSelected;

  @override
  State<MyTab> createState() => _MyTabState();
}

class _MyTabState extends State<MyTab> {
  @override
  Widget build(BuildContext context) {
    return Tab(
      // text: text,
      child: Container(
        // height: 40,
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          width: 60,
          height: 30,
          padding: const EdgeInsets.symmetric(vertical: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:
                widget.isSelected ? MyColors.primaryMint : MyColors.myDarkGrey,
            boxShadow: [MyTheme.defaultShadow],
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              color:
                  widget.isSelected ? MyColors.myPointWhite : MyColors.myGrey,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
