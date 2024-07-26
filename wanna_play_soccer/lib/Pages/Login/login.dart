import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login_background.jpg'),
                // https://pixabay.com/ko/photos/%EC%8A%A4%ED%8F%AC%EC%B8%A0-%EC%B6%95%EA%B5%AC-%EA%B3%B5-%ED%94%8C%EB%A0%88%EC%9D%B4%EC%96%B4-5490375/
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black, BlendMode.hue),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                MyColors.myBlack.withOpacity(0.2),
                MyColors.myBlack.withOpacity(0.8),
                MyColors.myBlack,
              ],
            )),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(50, 500, 50, 0),
              child: GestureDetector(
                onTap: () {
                  print('Kakao Login');
                },
                child: Image.asset('assets/images/kakao_login_large_wide.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
