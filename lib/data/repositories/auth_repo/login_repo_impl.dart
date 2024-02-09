import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:school_ai/core/params/endpoints.dart';
import 'package:school_ai/core/utils/errrors/failure.dart';
import 'package:school_ai/core/utils/network/api_services.dart';
import 'package:school_ai/data/models/logged_user/logged_user.dart';
import 'package:school_ai/data/repositories/auth_repo/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final ApiServices apiServices = ApiServices();

  @override
  Future<Either<Failure, LoggedUser>> login(
      String email, String password) async {
    try {
      final response = await apiServices
          .post(Endpoints.login, {"email": email, "password": password});
      // Check response status code and handle accordingly
      final loggedUser = LoggedUser.fromJson(response['data']);
      return Right(loggedUser);
    } catch (e) {
      // Handle Dio errors
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioException(
            e,
          ),
        );
      }
      return left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
