import 'package:flutter/material.dart';
import 'package:software_lab/core/utils/app_images.dart';
import 'package:software_lab/core/widgets/custom_button.dart';

class CustomContinueBackRow extends StatelessWidget {
  const CustomContinueBackRow({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SizedBox(height: 25, child: AppImages.back),
          ),
          CustomButton(
            aspectRatio: 3.5,
            title: 'Continue',
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
