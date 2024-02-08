import 'package:dartz/dartz.dart';
import 'package:school_ai/core/params/endpoints.dart';
import 'package:school_ai/core/utils/errrors/failure.dart';
import 'package:school_ai/core/utils/network/api_services.dart';
import 'package:school_ai/data/models/logged_user/logged_user.dart';
import 'package:school_ai/data/repositories/auth_repo/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final ApiServices apiServices;

  LoginRepoImpl(
    this.apiServices,
  );

  @override
  Future<Either<Failure, LoggedUser>> login(
      String email, String password) async {
    try {
      final response = await apiServices
          .post(Endpoints.login, {"email": email, "password": password});
      // Check response status code and handle accordingly
      if (response['status'] == 'success') {
        // Parse response data and return a LoggedUser object
        final loggedUser = LoggedUser.fromJson(response['data']);
        return Right(loggedUser);
      } else {
        // Handle error response
        return Left(ServerFailure(message: response['msg']));
      }
    } catch (e) {
      // Handle Dio errors
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
