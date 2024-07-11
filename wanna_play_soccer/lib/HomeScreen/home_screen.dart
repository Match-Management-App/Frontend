import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xdd20282D),
        title: Container(
          padding: const EdgeInsets.all(20.0),
          child: const Text(
            '반갑습니다 User님 👏',
            style: TextStyle(color: Color(0xffF5F9FC)),
          ),
        ),
        centerTitle: false,
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff20282D),
              Color(0xff38464F),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.15, bottom: 10.0, left: 20.0, right: 20.0),
            child: const Center(
              child: Column(
                children: [
                  Text(
                    '⚽️ Wanna Play Soccer? ⚽️',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Additional content...',
                    style: TextStyle(
                      fontSize: 180,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  // 필요에 따라 더 많은 위젯을 추가합니다.
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
