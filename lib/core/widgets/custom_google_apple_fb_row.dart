import 'package:flutter/material.dart';
import 'package:software_lab/core/utils/app_images.dart';
import 'package:software_lab/core/widgets/custom_login_with.dart';

class CustomGoogleAppleFBRow extends StatelessWidget {
  const CustomGoogleAppleFBRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomLoginWith(child: AppImages.google),
        CustomLoginWith(child: AppImages.apple),
        CustomLoginWith(child: AppImages.fb),
      ],
    );
  }
}
