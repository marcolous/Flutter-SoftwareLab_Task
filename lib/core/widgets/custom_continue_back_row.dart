import 'package:flutter/material.dart';
import 'package:software_lab/core/utils/app_images.dart';
import 'package:software_lab/core/widgets/custom_button.dart';

class CustomContinueBackRow extends StatelessWidget {
  const CustomContinueBackRow({super.key, required this.onPressed, this.title});
  final void Function() onPressed;
  final String? title;
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
            title: title ?? 'Continue',
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
