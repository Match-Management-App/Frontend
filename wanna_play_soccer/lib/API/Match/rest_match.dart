import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'match.dart';

part 'rest_match.g.dart';

@RestApi()
abstract class RestMatch {
  factory RestMatch(Dio dio, {String baseUrl}) = _RestMatch;

  @GET('/v1/matches/schedule')
  Future<NextMatch> getNextMatch();

  @GET('/v1/matches/month')
  Future<List<ScheduleOfMonth>> getScheduleOfMonth(@Query('month') int month);
}


/*
final restMatch = RestMatch(dio);

* 여기서 구하고 싶은 달 구하기
final month = 8;

final decemberSchedules = await restMatch.getScheduleOfMonth(month: month);
*/