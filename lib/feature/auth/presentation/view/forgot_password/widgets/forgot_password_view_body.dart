import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:software_lab/core/utils/app_images.dart';
import 'package:software_lab/core/utils/styles.dart';
import 'package:software_lab/core/widgets/custom_button.dart';
import 'package:software_lab/core/widgets/custom_text_field.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  final TextEditingController _phone = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    _phone.dispose();
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
              'Forgot Password?',
              style: Styles.style35(context),
            ),
            const Gap(25),
            Text.rich(
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
            const Gap(70),
            CustomTextField(
              prefixIcon: AppImages.email,
              hintText: 'Phone Number',
              controller: _phone,
              keyboardType: TextInputType.number,
            ),
            const Gap(30),
            CustomButton(
              title: 'Send Code',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
