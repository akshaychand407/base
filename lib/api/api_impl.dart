import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../app/app.locator.dart';
import '../utilities/utils.dart';
import '/services/api_service.dart';
import 'api_client/apiclient.dart';
import 'errors/server_error.dart';
import 'responses/model/user/user.dart';

class ApiImpl extends ApiService {
  // final NavigationService _navService = locator<NavigationService>();
  final ApiClient client = locator<ApiClient>();
  final String _appVersion = '1.0';

  checkUserValidation(response, functionName, token) async {
    if (response.code == 401) {
      //  Actions to be taken when a user is invalid
    }
  }

  @override
  Future<Either<String, User>> userLogin(
      String username, String password) async {
    if (await Utils.isConnected()) {
      try {
        var response = await client.userLogin(username, password, _appVersion);
        if (response.code == 200) {
          return Right(response.data!);
        } else {
          return Left(response.message);
        }
      } catch (error) {
        return Left(
            ServerError.withError(error: error as DioError).getErrorMessage());
      }
    } else {
      return Left(ServerError.withConnectionError().getErrorMessage());
    }
  }

  @override
  Future<Either<String, String>> userLogOut(String userId) async {
    if (await Utils.isConnected()) {
      try {
        var response = await client.userLogOut(userId);
        if (response.code == 200) {
          return const Right('Sign Out Successfully');
        } else {
          return Left(response.message);
        }
      } catch (error) {
        return Left(
            ServerError.withError(error: error as DioError).getErrorMessage());
      }
    } else {
      return Left(ServerError.withConnectionError().getErrorMessage());
    }
  }
}
