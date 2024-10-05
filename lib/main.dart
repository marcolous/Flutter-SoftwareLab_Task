import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:software_lab/core/utils/routes.dart';
import 'package:software_lab/feature/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:software_lab/feature/auth/presentation/view/all_done/all_done_view.dart';
import 'package:software_lab/feature/auth/presentation/view/forgot_password/forgot_password_view.dart';
import 'package:software_lab/feature/auth/presentation/view/login/login_view.dart';
import 'package:software_lab/feature/auth/presentation/view/register/register_view.dart';
import 'package:software_lab/feature/auth/presentation/view/reset_password/reset_password_view.dart';
import 'package:software_lab/feature/auth/presentation/view/verify_otp/verify_otp_view.dart';
import 'package:software_lab/feature/splash/presentation/view/splash_view.dart';
import 'package:software_lab/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const SoftwareLab());
}

class SoftwareLab extends StatelessWidget {
  const SoftwareLab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: SplashView(),
        routes: {
          Routes.kSplashView: (context) => SplashView(),
          Routes.kLoginView: (context) => const LoginView(),
          Routes.kRegisterView: (context) => const RegisterView(),
          Routes.kForgotPasswordView: (context) => const ForgotPasswordView(),
          Routes.kVerifyOtpView: (context) => const VerifyOtpView(),
          Routes.kResetPasswordView: (context) => const ResetPasswordView(),
          // Routes.kFormInfoView: (context) => const FormInfoView(),
          // Routes.kVerificationView: (context) => const VerificationView(),
          // Routes.kBusinessHoursView: (context) => const BusinessHoursView(),
          Routes.kAllDoneView: (context) => const AllDoneView(),
        },
      ),
    );
  }
}

//! to fix 
// form validator
// dont navigate till attach document

//* onboarding
//* login
//* forgot password
//* verify otp
//* reset password

//* register 
//* form info
//* verification
//* business hours
//* all done