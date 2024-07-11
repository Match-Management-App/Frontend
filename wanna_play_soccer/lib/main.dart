import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '⚽️ Wanna Play Soccer? ⚽️',
      theme: ThemeData(
        primaryColor: const Color(0xff20282D),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xff1EC1A4),
        ),
        fontFamily: 'Pretendard',
      ),
      home: SplashScreen(),
    );
  }
}
