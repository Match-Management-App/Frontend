import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';
import 'package:wanna_play_soccer/API/Auth/rest_login.dart';
import 'package:wanna_play_soccer/Pages/HomeScreen/main_screen.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Utils/env.dart';
import 'package:wanna_play_soccer/Utils/global.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final RestLogin _restLogin = RestLogin(dio, baseUrl: Env.baseUrl);
  bool _imageLoaded = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    final token = await storage.read(key: 'accessToken');

    if (!mounted) return;

    if (token != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      debugPrint('[ERR] 로그인이 필요합니다.');
    }
  }

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
                  debugPrint('Kakao Login');
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

        await loginWithKakao(token);
        navigateToHomeScreen();
        debugPrint('[INFO] 카카오톡 로그인 시도 | token: $token');
      } catch (e) {
        debugPrint('[ERR] 카카오톡 로그인 실패: $e');

        /// 로그인 취소
        if (e is PlatformException && e.code == 'CANCELED') {
          return;
        }

        /// 카카오톡 앱 없음 => 카카오 계정으로 로그인
        try {
          final OAuthToken token =
              await UserApi.instance.loginWithKakaoAccount();
          debugPrint('[INFO] 카카오 계정 로그인 시도 | token: $token');

          await loginWithKakao(token);
          navigateToHomeScreen();
        } catch (e) {
          debugPrint('[ERR] 카카오 계정 로그인 실패: $e');
        }
      }
    } else {
      try {
        final OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        debugPrint('[INFO] 카카오 계정 로그인 시도 | token: $token');

        await loginWithKakao(token);
        navigateToHomeScreen();
      } catch (e) {
        debugPrint('[ERR] 카카오 계정 로그인 실패: $e');
      }
    }
  }

  Future<void> loginWithKakao(OAuthToken token) async {
    try {
      final body = LoginRequest(
        accessToken: token.accessToken,
        code: Env.loginCode,
        position: 'testPosition',
      );
      final login = await _restLogin.login(body: body);

      debugPrint('[JWT] accessToken: ${login.accessToken}');
      debugPrint('[JWT] refreshToken: ${login.refreshToken}');
      await storage.write(key: 'accessToken', value: login.accessToken);
    } catch (e) {
      rethrow;
    }
  }

  // void addTokenToLocalStorage(OAuthToken token) async {
  //   await storage.write(key: 'accessToken', value: token.accessToken);
  //   debugPrint('[INFO] Token saved: ${token.accessToken}');
  // }

  void navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
}
