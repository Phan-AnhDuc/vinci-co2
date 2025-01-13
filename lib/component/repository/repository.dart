import 'package:MoveGreen/constant/end_points.dart';
import 'package:MoveGreen/model/api_response.dart';
import 'package:MoveGreen/services/dio_client.dart';
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

  @POST(Endpoints.login)
  Future<ApiResponse> login(@Body() Map<String, dynamic> body);

  @GET(Endpoints.me)
  Future<ApiResponse> getMe();
}
