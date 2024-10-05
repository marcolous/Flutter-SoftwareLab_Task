import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:software_lab/core/utils/app_images.dart';
import 'package:software_lab/core/utils/styles.dart';
import 'package:software_lab/core/widgets/custom_button.dart';
import 'package:software_lab/core/widgets/custom_google_apple_fb_row.dart';
import 'package:software_lab/core/widgets/custom_login_text.dart';
import 'package:software_lab/core/widgets/custom_text_field.dart';
import 'package:software_lab/data/models/register_request_model.dart';
import 'package:software_lab/feature/auth/presentation/view/form_info/form_info_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _reEnterPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final RegisterRequestModel registerRequest = RegisterRequestModel();

  @override
  void dispose() {
    _fullName.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
    _reEnterPassword.dispose();
    super.dispose();
  }

  void _collectFormData() {
    if (formKey.currentState!.validate()) {
      if (_password.text != _reEnterPassword.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passwords do not match')),
        );
        return;
      }
      registerRequest.fullName = _fullName.text;
      registerRequest.email = _email.text;
      registerRequest.phone = _phone.text;
      registerRequest.password = _password.text;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FormInfoView(registerRequest: registerRequest),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: RegisterBottomNavBar(onPressed: _collectFormData),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.start,
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
                  prefixIcon: AppImages.name,
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
                  prefixIcon: AppImages.phone,
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
                const Gap(30),
                const Gap(20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterBottomNavBar extends StatelessWidget {
  const RegisterBottomNavBar({
    super.key,
    required this.onPressed,
  });
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomLoginText(),
            CustomButton(
              aspectRatio: 3.5,
              title: 'Continue',
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
