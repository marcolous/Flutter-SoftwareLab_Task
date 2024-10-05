import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:software_lab/core/utils/app_images.dart';
import 'package:software_lab/core/utils/styles.dart';
import 'package:software_lab/core/widgets/custom_continue_back_row.dart';
import 'package:software_lab/core/widgets/custom_dro_down_menu.dart';
import 'package:software_lab/core/widgets/custom_text_field.dart';
import 'package:software_lab/data/models/register_request_model.dart';
import 'package:software_lab/feature/auth/presentation/view/verification/verification_view.dart';

class FormInfoView extends StatefulWidget {
  const FormInfoView({super.key, required this.registerRequest});
  final RegisterRequestModel registerRequest;

  @override
  State<FormInfoView> createState() => _FormInfoViewState();
}

class _FormInfoViewState extends State<FormInfoView> {
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

  void _collectFormData() {
    if (formKey.currentState!.validate()) {
      widget.registerRequest.businessName = _businessName.text;
      widget.registerRequest.informalName = _informalName.text;
      widget.registerRequest.address = _streetAddress.text;
      widget.registerRequest.city = _city.text;
      widget.registerRequest.state = _state.text;
      widget.registerRequest.zipCode = int.tryParse(_zipcode.text);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              VerificationView(registerRequest: widget.registerRequest),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomContinueBackRow(onPressed: _collectFormData),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: formKey,
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
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
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(30),
                // CustomContinueBackRow(
                //   onPressed: _collectFormData,
                // ),
                const Gap(20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
