import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'form_validator_state.dart';

class FormValidatorCubit extends Cubit<FormValidatorState> {
  FormValidatorCubit() : super(const FormValidatorUpdate());

  void initForm({
    String email = '',
    String name = '',
    //String school = '',
    String city = '',
  }) {
    emit(state.copyWith(
      email: email,
      name: name,
      //school: school,
      city: city,
    ));
  }

  void updateEmail(String? email) {
    emit(state.copyWith(email: email));
  }

  void updatePassword(String? password) {
    emit(state.copyWith(password: password));
  }

  void updateConfirmPassword(String? confirmPassword) {
    emit(state.copyWith(confirmPassword: confirmPassword));
  }

  void updateName(String? name) {
    emit(state.copyWith(name: name));
  }

  // void updateAddress(String? school) {
  //   emit(state.copyWith(school: school));
  // }

  // void updateCity(String? city) {
  //   emit(state.copyWith(city: city));
  // }

  void updateAutovalidateMode(AutovalidateMode? autovalidateMode) {
    emit(state.copyWith(autovalidateMode: autovalidateMode));
  }

  void reset() {
    emit(const FormValidatorUpdate());
  }
}
