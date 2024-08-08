import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'chemistry.dart';

part 'chemistry_rest.g.dart';

@RestApi()
abstract class RestChemistry {
  factory RestChemistry(Dio dio, {String baseUrl}) = _RestChemistry;

  @GET('/v1/chemical/goals/worst')
  Future<TopThree> getLeastAssisted();
  // Future<ApiResponse<TopThree>> getLeastAssisted(@Header('Authorization') String token);

  @GET('/v1/chemical/goals/best')
  Future<TopThree> getMostAssisted();

  @GET('/v1/chemical/assists/worst')
  Future<TopThree> getLeastAssistsToMyGoals();

  @GET('/v1/chemical/assists/best')
  Future<TopThree> getMostAssistsToMyGoals();
}
