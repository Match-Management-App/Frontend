import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Component/subtitle.dart';

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
              height: 1000,
              width: double.infinity,
              color: Colors.indigo,
            )
          ],
        ),
      ),
    );
  }
}
