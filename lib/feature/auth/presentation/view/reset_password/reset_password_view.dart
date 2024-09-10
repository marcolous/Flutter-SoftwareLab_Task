import 'package:flutter/material.dart';
import 'package:software_lab/feature/auth/presentation/view/reset_password/widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResetPasswordViewBody(),
    );
  }
}