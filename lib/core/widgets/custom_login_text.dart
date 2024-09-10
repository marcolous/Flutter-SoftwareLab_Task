
import 'package:flutter/material.dart';
import 'package:software_lab/core/utils/routes.dart';
import 'package:software_lab/core/utils/styles.dart';

class CustomLoginText extends StatelessWidget {
  const CustomLoginText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.kLoginView,
        (route) => false,
      ),
      child: Text(
        'Login',
        style: Styles.style14(context).copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
