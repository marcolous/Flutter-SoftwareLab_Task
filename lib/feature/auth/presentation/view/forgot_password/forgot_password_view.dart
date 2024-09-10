import 'package:flutter/material.dart';
import 'package:software_lab/feature/auth/presentation/view/forgot_password/widgets/forgot_password_view_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ForgotPasswordViewBody(),
    );
  }
}