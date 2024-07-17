import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return ListView(
      padding: EdgeInsets.only(
          top: screenHeight * 0.14, bottom: 40, left: 20, right: 20),
      children: [
        const Text(
          'Home',
          style: TextStyle(
            color: MyColors.myWhite,
            fontSize: 50,
          ),
        ),
        // 스크롤 효과를 더 잘 보기 위한 추가 컨텐츠
        for (int i = 0; i < 10; i++)
          Container(
            color: Colors.primaries[i % Colors.primaries.length],
            height: 100,
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: Text('Item $i',
                style: const TextStyle(color: MyColors.myWhite)),
          ),
      ],
    );
  }
}
