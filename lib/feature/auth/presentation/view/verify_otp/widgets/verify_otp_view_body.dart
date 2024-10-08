// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:software_lab/core/utils/routes.dart';
import 'package:software_lab/core/utils/styles.dart';
import 'package:software_lab/core/widgets/custom_button.dart';
import 'package:software_lab/feature/auth/presentation/view/verify_otp/widgets/verification_input_row.dart';

class VerifyOtpViewBody extends StatefulWidget {
  const VerifyOtpViewBody({super.key});

  @override
  State<VerifyOtpViewBody> createState() => _VerifyOtpViewBodyState();
}

class _VerifyOtpViewBodyState extends State<VerifyOtpViewBody> {
  bool _allFieldsFilled = false;
  String _otp = '';
  bool isVerifying = false;
  bool isResendingVerify = false;

  void _onFieldsChange(bool allFieldsFilled) {
    setState(() {
      _allFieldsFilled = allFieldsFilled;
    });
  }

  void _onOtpChange(String otp) {
    setState(() {
      _otp = otp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FarmerEats',
              style: Styles.style20(context),
            ),
            const Gap(90),
            Text(
              'Verify OTP',
              style: Styles.style35(context),
            ),
            const Gap(25),
            GestureDetector(
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.kLoginView,
                (route) => false,
              ),
              child: Text.rich(
                TextSpan(
                  text: 'Remember your pasword?  ',
                  style: Styles.style16(context).copyWith(
                    color: const Color(0xff261C12).withOpacity(.3),
                  ),
                  children: [
                    TextSpan(
                      text: 'Login',
                      style: Styles.style16(context)
                          .copyWith(color: const Color(0xffD5715B)),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(70),
            VerifyOtpInputRow(
              onFieldsChanged: _onFieldsChange,
              onOtpChanged: _onOtpChange,
            ),
            const Gap(30),
            CustomButton(
              title: 'Submit',
              onPressed: () =>
                  Navigator.pushNamed(context, Routes.kResetPasswordView),
            ),
            const Gap(20),
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  'Resend Code',
                  style: Styles.style14(context).copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
