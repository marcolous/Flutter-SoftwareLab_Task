import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:software_lab/core/utils/app_images.dart';
import 'package:software_lab/core/utils/styles.dart';
import 'package:software_lab/core/widgets/custom_button.dart';
import 'package:software_lab/core/widgets/custom_google_apple_fb_row.dart';
import 'package:software_lab/core/widgets/custom_login_text.dart';
import 'package:software_lab/core/widgets/custom_text_field.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _reEnterPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    _fullName.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
    _reEnterPassword.dispose();
    super.dispose();
  }

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
              const Gap(30),
              Text(
                'Signup 1 of 4',
                style: Styles.style16(context).copyWith(
                  color: const Color(0xff261C12).withOpacity(.3),
                ),
              ),
              Text(
                'Welcome back!',
                style: Styles.style35(context),
              ),
              const Gap(40),
              const CustomGoogleAppleFBRow(),
              const Gap(30),
              Text(
                'or signup with',
                textAlign: TextAlign.center,
                style: Styles.style14(context).copyWith(
                  color: const Color(0xff261C12).withOpacity(.3),
                ),
              ),
              const Gap(30),
              CustomTextField(
                prefixIcon: AppImages.email,
                hintText: 'Full Name',
                controller: _fullName,
              ),
              const Gap(25),
              CustomTextField(
                prefixIcon: AppImages.email,
                hintText: 'Email Address',
                controller: _email,
              ),
              const Gap(25),
              CustomTextField(
                prefixIcon: AppImages.email,
                hintText: 'Phone Number',
                controller: _phone,
                keyboardType: TextInputType.number,
              ),
              const Gap(25),
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
              SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomLoginText(),
                    SizedBox(
                      // width: 300,
                      child: CustomButton(
                        aspectRatio: 3.5,
                        title: 'Continue',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
