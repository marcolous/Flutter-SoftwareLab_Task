import 'package:flutter/material.dart';
import 'package:software_lab/feature/auth/presentation/view/business_hours/widgets/business_hours_view_body.dart';

class BusinessHoursView extends StatelessWidget {
  const BusinessHoursView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BusinessHoursViewBody(),
    );
  }
}