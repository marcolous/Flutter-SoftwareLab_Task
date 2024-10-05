import 'package:flutter/material.dart';
import 'package:software_lab/core/widgets/failed_dialog.dart';
import 'package:software_lab/core/widgets/sucess_dialog.dart';

class ShowDialog {
  void showSuccessDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) => SucessDialog(title: title),
    );
  }

  void showFailedDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) => FailedDialog(title: title),
    );
  }
}
