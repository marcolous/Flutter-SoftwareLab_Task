import 'package:flutter/material.dart';
import 'package:software_lab/core/utils/routes.dart';
import 'package:software_lab/feature/auth/presentation/view/forgot_password/forgot_password_view.dart';
import 'package:software_lab/feature/auth/presentation/view/login/login_view.dart';
import 'package:software_lab/feature/auth/presentation/view/register/register_view.dart';
import 'package:software_lab/feature/auth/presentation/view/verify_otp/verify_otp_view.dart';
import 'package:software_lab/feature/splash/presentation/view/splash_view.dart';

void main() {
  runApp(const SoftwareLab());
}

class SoftwareLab extends StatelessWidget {
  const SoftwareLab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      routes: {
        Routes.kSplashView: (context) => SplashView(),
        Routes.kLoginView: (context) => const LoginView(),
        Routes.kRegisterView: (context) => const RegisterView(),
        Routes.kForgotPasswordView: (context) => const ForgotPasswordView(),
        Routes.kVerifyOtpView: (context) => const VerifyOtpView(),
      },
    );
  }
}

//* onboarding
//* login
// forgot password
// verify otp
// reset password

//* register 
// form info
// verification
// business hours
// all done