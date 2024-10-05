import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:software_lab/data/models/register_request_model.dart';
import 'package:software_lab/data/services/auth_services.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  //! Register cubit
  Future<void> registerUser({
    required RegisterRequestModel registerRequest,
  }) async {
    emit(RegisterLoading());
    final AuthServices authServices = AuthServices();
    var result = await authServices.registerUser(
      registerRequest: registerRequest,
    );
    if (result == null) {
      emit(RegisterSucess());
    } else {
      emit(RegisterFailure(errMessage: result.errMessage));
    }
  }

  //! login cubit
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final AuthServices authServices = AuthServices();
    var result = await authServices.loginUser(
      email: email,
      password: password,
    );
    if (result == null) {
      emit(LoginSucess());
    } else {
      emit(LoginFailure(errMessage: result.errMessage));
    }
  }

  //! Forgot Password
  Future<void> forgotPassword({
    required String mobile,
  }) async {
    emit(ForgotPasswordLoading());
    final AuthServices authServices = AuthServices();
    var result = await authServices.forgotPassword(
      mobile: mobile,
    );
    if (result == null) {
      emit(ForgotPasswordSucess());
    } else {
      emit(ForgotPasswordFailure(errMessage: result.errMessage));
    }
  }

  //! Verify Otp
  Future<void> verifyOtp({
    required String otp,
  }) async {
    emit(VerifyOtpLoading());
    final AuthServices authServices = AuthServices();
    var result = await authServices.verifyOtp(
      otp: otp,
    );
    if (result == null) {
      emit(VerifyOtpSucess());
    } else {
      emit(VerifyOtpFailure(errMessage: result.errMessage));
    }
  }

  //! Password Reset cubit
  Future<void> resetPassword({
    required String token,
    required String password,
    required String cpassword,
  }) async {
    emit(PasswordResetLoading());
    final AuthServices authServices = AuthServices();
    var result = await authServices.resetPassword(
      token: token,
      password: password,
      cpassword: cpassword,
    );
    if (result == null) {
      emit(PasswordResetSucess());
    } else {
      emit(PasswordResetFailure(errMessage: result.errMessage));
    }
  }
}
