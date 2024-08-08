import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:wanna_play_soccer/Pages/HomeScreen/main_screen.dart';
import 'package:wanna_play_soccer/Pages/Login/login.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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
        primaryColor: MyColors.myBlack,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: MyColors.primaryMint,
        ),
        fontFamily: 'Pretendard',
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
          ),
        ),
      ),
      // home: const HomeScreen(),
      home: const Login(),
      // home: RetrofitDioJson(),
    );
  }
}
