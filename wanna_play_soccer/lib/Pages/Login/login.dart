import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_template.dart';
import 'package:wanna_play_soccer/Pages/HomeScreen/main_screen.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _imageLoaded = false;

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    _loadImage();
  }

  Future<void> _loadImage() async {
    const ImageProvider provider =
        AssetImage('assets/images/login_background.jpg');
    await precacheImage(provider, context);
    setState(() {
      _imageLoaded = true;
    });
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (_imageLoaded)
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/login_background.jpg'),
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
              ),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(50, 500, 50, 0),
              child: GestureDetector(
                onTap: () {
                  print('Kakao Login');
                  signWithKakao();
                },
                child: Image.asset('assets/images/kakao_login_large_wide.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void signWithKakao() async {
    bool isKakaoInstalled = await isKakaoTalkInstalled();
    if (isKakaoInstalled) {
      try {
        final OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        print('[INFO] 카카오톡 로그인 성공');
      } catch (e) {
        print('[ERR] 카카오톡 로그인 실패: $e');

        /// 로그인 취소
        if (e is PlatformException && e.code == 'CANCELED') {
          return;
        }

        /// 카카오톡 앱 없음 => 카카오 계정으로 로그인
        try {
          final OAuthToken token =
              await UserApi.instance.loginWithKakaoAccount();
          print('[INFO] 카카오 계정 로그인 성공');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } catch (e) {
          print('[ERR] 카카오 계정 로그인 실패: $e');
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        print('[INFO] 카카오 계정 로그인 성공');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } catch (e) {
        print('[ERR] 카카오 계정 로그인 실패: $e');
      }
    }
  }
}
