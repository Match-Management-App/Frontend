import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'user.dart';

part 'user_rest.g.dart';

@RestApi()
abstract class RestUser {
  factory RestUser(Dio dio, {String baseUrl}) = _RestUser;

  @GET('/v1/users/me')
  // Future<User> getUser({@Header('Authorization') required String token});
  Future<User> getUser();
}
