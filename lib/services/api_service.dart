import 'package:dartz/dartz.dart';
import '../api/responses/model/user/user.dart';

abstract class ApiService {
  Future<Either<String, User>> userLogin(String username, String password);
  Future<Either<String, String>> userLogOut(String userId);
}
