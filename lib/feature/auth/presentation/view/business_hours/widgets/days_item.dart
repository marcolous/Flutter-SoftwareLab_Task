import 'package:flutter/material.dart';
import 'package:software_lab/core/utils/styles.dart';

class DaysItem extends StatelessWidget {
  const DaysItem({
    super.key,
    required this.title,
    required this.isSelected,
    this.onTap,
  });
  final String title;
  final bool isSelected;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? const Color(0xffD5715B) : null,
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : const Color(0xff261C12).withOpacity(.3),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: Styles.style16(context).copyWith(
              color: isSelected ? Colors.white : const Color(0xff261C12),
            ),
          ),
        ),
      ),
    );
  }
}
