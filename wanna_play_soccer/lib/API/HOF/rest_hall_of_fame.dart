import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'hall_of_fame.dart';

part 'rest_hall_of_fame.g.dart';

@RestApi()
abstract class RestHOF {
  factory RestHOF(Dio dio, {String baseUrl}) = _RestHOF;

  @GET('/v1/record/goals/hall-of-fame')
  Future<List<HallOfFame>> getHOFGoals(
      {@Header('authorization') required String token});

  @GET('/v1/record/assists/hall-of-fame')
  Future<List<HallOfFame>> getHOFAssists();

  @GET('/v1/record/defences/hall-of-fame')
  Future<List<HallOfFame>> getHOFDefences();

  @GET('/v1/record/attendance/hall-of-fame')
  Future<List<HallOfFame>> getHOFAttendance();
}
