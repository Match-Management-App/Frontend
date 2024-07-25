import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiController extends InterceptorsWrapper {
  final storage = const FlutterSecureStorage();
  final Dio dio = Dio();
  
}
