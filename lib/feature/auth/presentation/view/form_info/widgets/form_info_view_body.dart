import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:software_lab/core/utils/app_images.dart';
import 'package:software_lab/core/utils/styles.dart';
import 'package:software_lab/core/widgets/custom_button.dart';
import 'package:software_lab/core/widgets/custom_dro_down_menu.dart';
import 'package:software_lab/core/widgets/custom_text_field.dart';

class FormInfoViewBody extends StatefulWidget {
  const FormInfoViewBody({super.key});

  @override
  State<FormInfoViewBody> createState() => _FormInfoViewBodyState();
}

class _FormInfoViewBodyState extends State<FormInfoViewBody> {
  final TextEditingController _businessName = TextEditingController();
  final TextEditingController _informalName = TextEditingController();
  final TextEditingController _streetAddress = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _zipcode = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    _businessName.dispose();
    _informalName.dispose();
    _streetAddress.dispose();
    _city.dispose();
    _state.dispose();
    _zipcode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FarmerEats',
                style: Styles.style20(context),
              ),
              const Gap(30),
              Text(
                'Signup 2 of 4',
                style: Styles.style16(context).copyWith(
                  color: const Color(0xff261C12).withOpacity(.3),
                ),
              ),
              Text(
                'Farm Info',
                style: Styles.style35(context),
              ),
              const Gap(40),
              CustomTextField(
                prefixIcon: AppImages.business,
                hintText: 'Business Name',
                controller: _businessName,
              ),
              const Gap(25),
              CustomTextField(
                prefixIcon: AppImages.informal,
                hintText: 'Informal Name',
                controller: _informalName,
              ),
              const Gap(25),
              CustomTextField(
                prefixIcon: AppImages.street,
                hintText: 'Street Address',
                controller: _streetAddress,
              ),
              const Gap(25),
              CustomTextField(
                prefixIcon: AppImages.city,
                hintText: 'City',
                controller: _city,
              ),
              const Gap(25),
              SizedBox(
                height: 80,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomDropDownMenu(
                        onSelected: (String? value) {
                          _state.text = value ?? '';
                        },
                      ),
                    ),
                    const Gap(15),
                    Expanded(
                      flex: 3,
                      child: CustomTextField(
                        hintText: 'Enter Zipcode',
                        controller: _zipcode,
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(child: Gap(30)),
              SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(height: 25, child: AppImages.back),
                    ),
                    CustomButton(
                      aspectRatio: 3.5,
                      title: 'Continue',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const Gap(20)
            ],
          ),
        ),
      ),
    );
  }
}
