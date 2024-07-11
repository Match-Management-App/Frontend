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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff20282D),
        title: Container(
          padding: const EdgeInsets.all(20.0),
          child: const Text(
            '반갑습니다 User님 👏',
            style: TextStyle(color: Color(0xffF5F9FC)),
          ),
        ),
        centerTitle: false,
      ),
      body: Container(
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
        child: const Center(
          child: Text(
            '⚽️ Wanna Play Soccer? ⚽️',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
