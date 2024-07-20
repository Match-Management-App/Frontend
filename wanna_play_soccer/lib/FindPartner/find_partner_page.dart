import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Component/subtitle.dart';
import 'package:wanna_play_soccer/FindPartner/Widget/partner_rank.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

class FindPartnerPage extends StatelessWidget {
  const FindPartnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

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
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: MyTheme.backgroundColor,
        height: screenHeight,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, screenHeight * 0.1, 30, 40),
            child: const Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 15)),
                Subtitle(icon: "🥰", subtitle: "환상의 짝궁"),
                PartnerRank(first: "USER", second: "USER", third: "USER"),
                Subtitle(icon: "🤡", subtitle: "환장의 짝궁"),
                PartnerRank(first: "USER", second: "USER", third: "USER"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
