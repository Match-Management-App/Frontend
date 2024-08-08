import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'stat.dart';

part 'rest_stat.g.dart';

@RestApi()
abstract class RestStat {
  factory RestStat(Dio dio, {String baseUrl}) = _RestStat;

  @POST('/v1/stat')
  Future<Stat> createStat(@Body() Stat stat);
  // Future<Stat> createStat(
  //     @Body() Stat stat, @Header('Authorization') String token);

  @GET('/v1/stat/recently-record')
  Future<List<RecentRecord>> getRecentRecord();
}
