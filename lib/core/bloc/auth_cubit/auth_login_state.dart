part of 'auth_login_cubit.dart';

@immutable
// Update the minimum SDK constraint to 3.0.0 or higher in pubspec.yaml and run 'pub get'
sealed class AuthLoginState extends Equatable {
  const AuthLoginState();

  // ...

  @override
  List<Object> get props => [];
}

final class AuthLoginInitial extends AuthLoginState {}

final class AuthLoginLoading extends AuthLoginState {}

final class AuthLoginFailuer extends AuthLoginState {
  final String message;

  AuthLoginFailuer(this.message);

  @override
  List<Object> get props => [message];
}

final class AuthLoginSuccess extends AuthLoginState {}

final class AuthLoginValidationError extends AuthLoginState {
  final String message;

  AuthLoginValidationError(this.message);

  @override
  List<Object> get props => [message];
}

final class AuthLoginValid extends AuthLoginState {}
