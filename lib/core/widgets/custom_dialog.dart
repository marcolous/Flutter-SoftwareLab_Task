import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:software_lab/core/utils/styles.dart';
import 'package:software_lab/core/widgets/custom_button.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });
  final String title;
  final Widget icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          IntrinsicHeight(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const Gap(75),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Styles.style16(context).copyWith(color: Colors.grey),
                  ),
                  const Expanded(child: Gap(10)),
                  CustomButton(
                    title: 'Close',
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: -60,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: color,
                  border: Border.all(
                    color: Colors.white,
                    width: 8,
                  ),
                ),
                child: icon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
