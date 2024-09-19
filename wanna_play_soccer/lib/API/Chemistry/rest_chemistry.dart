import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'chemistry.dart';

part 'rest_chemistry.g.dart';

@RestApi()
abstract class RestChemistry {
  factory RestChemistry(Dio dio, {String baseUrl}) = _RestChemistry;

  @GET('/v1/chemical/goals/worst')
  Future<TopThree> getLeastAssisted(
      {@Header('authorization') required String token});

  @GET('/v1/chemical/goals/best')
  Future<TopThree> getMostAssisted(
      {@Header('authorization') required String token});

  @GET('/v1/chemical/assists/worst')
  Future<TopThree> getLeastAssistsToMyGoals(
      {@Header('authorization') required String token});

  @GET('/v1/chemical/assists/best')
  Future<TopThree> getMostAssistsToMyGoals(
      {@Header('authorization') required String token});
}
