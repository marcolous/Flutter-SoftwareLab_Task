import 'package:flutter/material.dart';
import 'package:software_lab/core/utils/routes.dart';
import 'package:software_lab/feature/splash/presentation/view/splash_view.dart';

void main() {
  runApp(const SoftwareLab());
}

class SoftwareLab extends StatelessWidget {
  const SoftwareLab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      routes: {
        Routes.kSplashView: (context) => SplashView(),
        // Routes.kRegisterView: (context) => const RegisterView(),
        // Routes.kLoginView: (context) => const LoginView(),
      },
    );
  }
}

//* onboarding
// login
// forgot password
// verify otp
// reset password

// register 
//? form info
//? verification
//? business hours
//? all done