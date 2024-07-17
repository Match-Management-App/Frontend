import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      padding: EdgeInsets.only(
          top: screenHeight * 0.14, bottom: 40, left: 20, right: 20),
      child: Column(
        children: [
          const Text(
            'Record',
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
      ),
    );
  }
}
