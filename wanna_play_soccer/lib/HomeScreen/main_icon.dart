import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';

class MainIcon extends StatelessWidget {
  final String title;
  final int index;
  final ValueChanged<int> onTap;
  final bool isSelected;

  const MainIcon({
    super.key,
    required this.title,
    required this.index,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(60, 30),
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        backgroundColor:
            isSelected ? MyColors.primaryMint : MyColors.myDarkGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: () => onTap(index),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? MyColors.myPointWhite : MyColors.myGrey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
