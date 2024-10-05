// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:software_lab/core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.suffixIcon,
    this.prefixIcon,
    required this.hintText,
    this.keyboardType,
    this.obscureText,
    required this.controller,
    this.inputFormatters,
  });
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Required field';
          }
        },
        inputFormatters: inputFormatters,
        autocorrect: false,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType ?? TextInputType.emailAddress,
        style: Styles.style16(context).copyWith(color: const Color(0xff8B8B8B)),
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: prefixIcon,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: suffixIcon,
          ),
          prefixIconConstraints: const BoxConstraints(maxHeight: 25),
          suffixIconConstraints: const BoxConstraints(maxHeight: 40),
          hintText: hintText,
          hintStyle: Styles.style15(context).copyWith(
            color: Colors.black.withOpacity(.3),
          ),
          filled: true,
          fillColor: const Color(0xffEEEDEC),
          focusedBorder: borderDecoration(),
          enabledBorder: borderDecoration(),
          errorBorder: errBorderDecoration(),
          focusedErrorBorder: errBorderDecoration(),
          contentPadding: const EdgeInsets.all(20),
        ),
      ),
    );
  }

  OutlineInputBorder borderDecoration() {
    return OutlineInputBorder(
      // borderRadius: BorderRadius.circular(12),
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Color(0xffEEEDEC),
        width: 2,
      ),
    );
  }

  OutlineInputBorder errBorderDecoration() {
    return OutlineInputBorder(
      // borderRadius: BorderRadius.circular(12),
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 2,
      ),
    );
  }
}
