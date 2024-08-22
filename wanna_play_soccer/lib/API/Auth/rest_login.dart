import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'login.dart';

part 'rest_login.g.dart';

@RestApi()
abstract class RestLogin {
  factory RestLogin(Dio dio, {String baseUrl}) = _RestLogin;

  @POST('/v1/login')
  Future<Login> login({
    @Body() required LoginRequest body,
  });
}

class LoginRequest {
  final String accessToken;
  final String code;
  final String position;

  LoginRequest({
    required this.accessToken,
    required this.code,
    required this.position,
  });

  Map<String, dynamic> toJson() => {
        'accessToken': accessToken,
        'code': code,
        'position': position,
      };
}
