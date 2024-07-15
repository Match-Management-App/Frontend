import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';

class MainIcon extends StatefulWidget {
  final String title;

  const MainIcon({super.key, required this.title});

  @override
  State<MainIcon> createState() => _MainIconState();
}

class _MainIconState extends State<MainIcon> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(60, 30),
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        backgroundColor: MyColors.primaryMint,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: () {
        print(widget.title);
      },
      child: Text(
        widget.title,
        style: const TextStyle(
          color: MyColors.myPointWhite,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
