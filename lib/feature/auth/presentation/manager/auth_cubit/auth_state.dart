part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

//! register status
class RegisterLoading extends AuthState {}

class RegisterSucess extends AuthState {}

class RegisterFailure extends AuthState {
  final String errMessage;

  RegisterFailure({required this.errMessage});
}

//! login status
class LoginLoading extends AuthState {}

class LoginSucess extends AuthState {}

class LoginFailure extends AuthState {
  final String errMessage;

  LoginFailure({required this.errMessage});
}

//! Forgot Password status
class ForgotPasswordLoading extends AuthState {}

class ForgotPasswordSucess extends AuthState {}

class ForgotPasswordFailure extends AuthState {
  final String errMessage;

  ForgotPasswordFailure({required this.errMessage});
}

//! Verify Otp status
class VerifyOtpLoading extends AuthState {}

class VerifyOtpSucess extends AuthState {}

class VerifyOtpFailure extends AuthState {
  final String errMessage;

  VerifyOtpFailure({required this.errMessage});
}

//! Password Reset status
class PasswordResetLoading extends AuthState {}

class PasswordResetSucess extends AuthState {}

class PasswordResetFailure extends AuthState {
  final String errMessage;

  PasswordResetFailure({required this.errMessage});
}
