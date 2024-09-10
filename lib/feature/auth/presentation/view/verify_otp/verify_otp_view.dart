import 'package:flutter/material.dart';
import 'package:software_lab/feature/auth/presentation/view/verify_otp/widgets/verify_otp_view_body.dart';

class VerifyOtpView extends StatelessWidget {
  const VerifyOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VerifyOtpViewBody(),
    );
  }
}