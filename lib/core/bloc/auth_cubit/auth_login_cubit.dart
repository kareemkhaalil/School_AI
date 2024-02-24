import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:school_ai/core/utils/service_locator.dart';
import 'package:school_ai/data/repositories/auth_repo/login_repo.dart';
import 'package:school_ai/data/repositories/hive_repo/hive_repo.dart';

part 'auth_login_state.dart';

class AuthLoginCubit extends Cubit<AuthLoginState> {
  AuthLoginCubit(
    this.loginRepo,
  ) : super(AuthLoginInitial());
  final LoginRepo loginRepo;
  late final HiveRepo hiveRepo = getIt.get<HiveRepo>();
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login(
    name,
    password,
  ) async {
    emit(AuthLoginLoading());

    var result = await loginRepo.login(name, password);
    debugPrint("auth login cubit =  $result");

    result.fold(
      (failure) {
        emit(AuthLoginFailuer(failure.errMesage));
      },
      (loggedUser) {
        if (result.isRight()) {
          hiveRepo.put(
            "token",
            loggedUser.data!.token!,
          );
        }

        emit(AuthLoginSuccess());
      },
    );
  }

  refresh() {
    emit(AuthLoginInitial());
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  validateName(name) async {
    if (name.isEmpty) {
      emit(AuthLoginValidationError(" ادخل اسم المستخدم"));
    } else {
      emit(AuthLoginValid());
    }
  }

  validatePassword(password) async {
    if (password.isEmpty) {
      emit(AuthLoginValidationError(" ادخل كلمة السر "));
    } else {
      emit(AuthLoginValid());
    }
  }
}
