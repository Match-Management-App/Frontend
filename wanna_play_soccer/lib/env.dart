import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'BASE_URL', obfuscate: true)
  static final String baseUrl = _Env.baseUrl;

  @EnviedField(varName: 'KAKAO_API_KEY', obfuscate: true)
  static final String kakaoNativeAppKey = _Env.kakaoNativeAppKey;
}
