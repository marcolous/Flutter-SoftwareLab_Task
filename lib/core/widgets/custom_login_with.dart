import 'package:flutter/material.dart';

class CustomLoginWith extends StatelessWidget {
  const CustomLoginWith({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 120,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: Colors.black.withOpacity(.08),
          width: 2,
        ),
      ),
      child: child,
    );
  }
}
