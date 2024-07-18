import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Component/subtitle.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: screenHeight * 0.14, bottom: 40, left: 30, right: 30),
        child: Column(
          children: [
            const Subtitle(icon: "📆", subtitle: "다음 경기"),
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: MyColors.widgetGrey,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [MyTheme.iconShadow],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 80,
                    width: 5,
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: MyColors.primaryMint,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(
                    width: 85,
                    child: Column(
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
                          style: TextStyle(
                            color: MyColors.myLightGrey,
                            fontSize: 18,
                          ),
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
                  const SizedBox(
                    width: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "장소: ~~~",
                          style: TextStyle(
                            color: MyColors.myWhite,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "인원: ~~~",
                          style: TextStyle(
                            color: MyColors.myWhite,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Subtitle(icon: "🏅", subtitle: "나의 기록"),
            const SizedBox(height: 15),
            const Subtitle(icon: "👯", subtitle: "짝궁 찾기"),
          ],
        ),
      ),
    );
  }
}
