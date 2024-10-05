import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:software_lab/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.borderRadius,
    this.aspectRatio,
    this.hMargin,
    this.vMargin,
    this.isLoading,
  });
  final String title;
  final void Function() onPressed;
  final double? borderRadius;
  final double? hMargin;
  final double? vMargin;
  final double? aspectRatio;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio ?? 6,
      child: ModalProgressHUD(
        color: Colors.transparent,
        inAsyncCall: isLoading ?? false,
        progressIndicator: const CircularProgressIndicator(
          color: Colors.white,
        ),
        child: AspectRatio(
          aspectRatio: aspectRatio ?? 6,
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: hMargin ?? 0, vertical: vMargin ?? 0),
            decoration: BoxDecoration(
              color: const Color(0xffD5715B),
              borderRadius: BorderRadius.circular(borderRadius ?? 100),
            ),
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 100),
                ),
                backgroundColor: const Color(0xffD5715B),
                overlayColor: const Color(0xffD5715B),
                // elevation: 5,
                // shadowColor: Colors.black,
              ),
              child: Text(
                title,
                style: Styles.style22(context).copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
