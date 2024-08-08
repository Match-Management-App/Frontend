import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_refresh.g.dart';

@RestApi()
abstract class RestRefresh {
  factory RestRefresh(Dio dio, {String baseUrl}) = _RestRefresh;

  @POST('refresh api')
  Future<dynamic> refreshToken(
    @Header('Authorization') String token,
  );
}
