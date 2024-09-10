import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:software_lab/core/utils/app_images.dart';
import 'package:software_lab/core/utils/routes.dart';
import 'package:software_lab/core/utils/styles.dart';
import 'package:software_lab/core/widgets/custom_button.dart';
import 'package:software_lab/core/widgets/custom_google_apple_fb_row.dart';
import 'package:software_lab/core/widgets/custom_text_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Text(
                'FarmerEats',
                style: Styles.style20(context),
              ),
              const Gap(90),
              Text(
                'Welcome back!',
                style: Styles.style35(context),
              ),
              const Gap(25),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routes.kRegisterView);
                },
                child: Text.rich(
                  TextSpan(
                    text: 'New here?',
                    style: Styles.style16(context).copyWith(
                      color: const Color(0xff261C12).withOpacity(.3),
                    ),
                    children: [
                      TextSpan(
                        text: '  Create account',
                        style: Styles.style16(context)
                            .copyWith(color: const Color(0xffD5715B)),
                      ),
                    ],
                  ),
                ),
              ),
              const Text('  '),
              const Gap(70),
              CustomTextField(
                prefixIcon: AppImages.email,
                hintText: 'Email Address',
                controller: _email,
              ),
              const Gap(25),
              CustomTextField(
                prefixIcon: AppImages.password,
                hintText: 'Password',
                controller: _password,
                obscureText: true,
                suffixIcon: GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    Routes.kForgotPasswordView,
                  ),
                  child: Text(
                    'Forgot?',
                    style: Styles.style16(context).copyWith(
                      color: const Color(0xffD5715B),
                    ),
                  ),
                ),
              ),
              const Gap(30),
              CustomButton(
                title: 'Login',
                onPressed: () {},
              ),
              const Gap(30),
              Text(
                'or login with',
                textAlign: TextAlign.center,
                style: Styles.style14(context).copyWith(
                  color: const Color(0xff261C12).withOpacity(.3),
                ),
              ),
              const Gap(30),
              const CustomGoogleAppleFBRow()
            ],
          ),
        ),
      ),
    );
  }
}
