import 'package:flutter/material.dart';
import 'package:software_lab/core/widgets/custom_dialog.dart';

class FailedDialog extends StatelessWidget {
  const FailedDialog({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      color: Colors.red,
      title: title,
      icon: const Icon(
        Icons.close_rounded,
        color: Colors.white,
        size: 90,
      ),
    );
  }
}
