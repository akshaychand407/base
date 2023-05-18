import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../responses/no_data_response/no_data_response.dart';
import '../responses/sign_in/sign_in_response.dart';
part 'apiclient.g.dart';

@RestApi(baseUrl: 'Your base url')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 15),
        validateStatus: (status) => status! < 550);
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  static ApiClient create() {
    final dio = Dio();
    return ApiClient(dio);
  }

  @POST('/login')
  Future<SignInResponse> userLogin(
      @Field('username') String username,
      @Field('password') String password,
      @Field('appVersion') String appVersion);
  @POST('/logout')
  Future<NoDataResponse> userLogOut(@Field('_id') String userId);
}
