part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninSuccess extends SigninState {
  final UserEntite userEntite;

  SigninSuccess({required this.userEntite});
}

final class SigninFailure extends SigninState {
  final String message;

  SigninFailure({required this.message});
}
