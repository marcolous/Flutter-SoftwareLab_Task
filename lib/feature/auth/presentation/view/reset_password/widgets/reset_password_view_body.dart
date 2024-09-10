import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:software_lab/core/utils/app_images.dart';
import 'package:software_lab/core/utils/routes.dart';
import 'package:software_lab/core/utils/styles.dart';
import 'package:software_lab/core/widgets/custom_button.dart';
import 'package:software_lab/core/widgets/custom_text_field.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _reEnterPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    _password.dispose();
    _reEnterPassword.dispose();
    super.dispose();
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
              'Reset Password',
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
            CustomTextField(
              prefixIcon: AppImages.password,
              hintText: 'Password',
              controller: _password,
              obscureText: true,
            ),
            const Gap(25),
            CustomTextField(
              prefixIcon: AppImages.password,
              hintText: 'Re-enter Password',
              controller: _reEnterPassword,
              obscureText: true,
            ),
            const Gap(30),
            CustomButton(
              title: 'Submit',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
