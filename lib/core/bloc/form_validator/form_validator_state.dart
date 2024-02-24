part of 'form_validator_cubit.dart';

@immutable
abstract class FormValidatorState {
  final AutovalidateMode autovalidateMode;
  final String email;
  final String password;
  final String confirmPassword;
  final String name;
  final String school;
  final String city;

  const FormValidatorState({
    this.autovalidateMode = AutovalidateMode.disabled,
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.name = '',
    this.school = '',
    this.city = '',
  });

  FormValidatorState copyWith({
    AutovalidateMode? autovalidateMode,
    String? email,
    String? password,
    String? confirmPassword,
    String? name,
    String? school,
    String? city,
  });
}

class FormValidatorUpdate extends FormValidatorState {
  const FormValidatorUpdate({
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    String email = '',
    String password = '',
    String confirmPassword = '',
    String name = '',
    String school = '',
    String city = '',
  }) : super(
          autovalidateMode: autovalidateMode,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
          name: name,
          school: school,
          city: city,
        );

  @override
  FormValidatorUpdate copyWith({
    AutovalidateMode? autovalidateMode,
    String? email,
    String? password,
    String? confirmPassword,
    String? name,
    String? school,
    String? city,
  }) {
    return FormValidatorUpdate(
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      school: school ?? this.school,
      city: city ?? this.city,
    );
  }
}
