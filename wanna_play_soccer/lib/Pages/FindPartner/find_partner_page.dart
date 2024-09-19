import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/API/Chemistry/rest_chemistry.dart';
import 'package:wanna_play_soccer/Component/subtitle.dart';
import 'package:wanna_play_soccer/Component/rank.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';
import 'package:wanna_play_soccer/Utils/env.dart';
import 'package:wanna_play_soccer/Utils/global.dart';

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
        // backgroundColor: MyColors.myBlack,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: MyTheme.tabBarGradient,
          ),
        ),
        backgroundColor: Colors.transparent,
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
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 15)),
                const Subtitle(icon: "🥰", subtitle: "환상의 짝궁"),
                PartnerRank(
                  fetchData: (token) => RestChemistry(dio, baseUrl: Env.baseUrl)
                      .getMostAssisted(token: token),
                ),
                const Subtitle(icon: "🤡", subtitle: "환장의 짝궁"),
                PartnerRank(
                  fetchData: (token) => RestChemistry(dio, baseUrl: Env.baseUrl)
                      .getLeastAssisted(token: token),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
