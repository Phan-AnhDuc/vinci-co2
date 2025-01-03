import 'package:basegetxbloc/constant/end_points.dart';
import 'package:basegetxbloc/model/api_response.dart';
import 'package:basegetxbloc/services/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'repository.g.dart';

class Api {
  Api._();
  static final Api _api = Api._();
  static Api get instance => _api;

  RestClientApi get restClient => RestClientApi(dioClient(Endpoints.baseUrl));
}

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class RestClientApi {
  factory RestClientApi(Dio dio, {String baseUrl}) = _RestClientApi;

  @GET(Endpoints.getUserByPhone)
  Future<ApiResponse> testBase(@Queries() Map<String, dynamic> body);
}
