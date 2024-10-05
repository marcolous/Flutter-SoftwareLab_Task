import 'package:flutter/material.dart';
import 'package:software_lab/core/widgets/custom_dialog.dart';

class SucessDialog extends StatelessWidget {
  const SucessDialog({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      color: Colors.green,
      title: title,
      icon: const Icon(
        Icons.check_rounded,
        color: Colors.white,
        size: 90,
      ),
      
    );
  }
}
