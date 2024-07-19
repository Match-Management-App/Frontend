import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Component/subtitle.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

class FindPartnerPage extends StatelessWidget {
  const FindPartnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: MyColors.myLightGrey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: MyColors.myBlack,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: const Text(
          '짝궁 찾기',
          style: TextStyle(color: MyColors.myWhite),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: MyTheme.backgroundColor,
        child: const Column(
          children: [
            Subtitle(icon: "🥰", subtitle: "환상의 짝궁"),
            Subtitle(icon: "🤡", subtitle: "환장의 짝궁"),
          ],
        ),
      ),
    );
  }
}
