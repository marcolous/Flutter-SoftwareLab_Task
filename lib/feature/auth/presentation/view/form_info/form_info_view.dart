import 'package:flutter/material.dart';
import 'package:software_lab/feature/auth/presentation/view/form_info/widgets/form_info_view_body.dart';

class FormInfoView extends StatelessWidget {
  const FormInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FormInfoViewBody(),
    );
  }
}