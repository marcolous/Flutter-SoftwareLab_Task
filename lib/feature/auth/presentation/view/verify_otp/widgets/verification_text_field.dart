import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:software_lab/core/utils/styles.dart';

class VerificationTextField extends StatelessWidget {
  const VerificationTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
    this.prevFocusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final FocusNode? prevFocusNode;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 80,
        child: TextFormField(
          validator: (value) => _validator(value),
          keyboardType: TextInputType.phone,
          textAlign: TextAlign.center,
          style: Styles.style20(context),
          controller: controller,
          textInputAction: TextInputAction.next,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
          focusNode: focusNode,
          onChanged: (value) => _onChanged(value, context),
          onFieldSubmitted: (value) => _onFieldSubmitted(value),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[300],
            focusedBorder: borderDecoration(),
            enabledBorder: borderDecoration(),
            errorBorder: errBorderDecoration(),
            focusedErrorBorder: errBorderDecoration(),
            contentPadding: const EdgeInsets.all(20),
          ),
        ),
      ),
    );
  }

  //? methods
  String? _validator(String? value) {
    if (value!.isEmpty) {
      return 'Required';
    }
    return null;
  }

  void _onChanged(String value, BuildContext context) {
    if (value.length == 1) {
      if (nextFocusNode != null) {
        FocusScope.of(context).requestFocus(nextFocusNode);
      } else {
        focusNode.unfocus();
      }
    } else if (value.isEmpty) {
      if (prevFocusNode != null) {
        FocusScope.of(context).requestFocus(prevFocusNode);
      }
    }
  }

  void _onFieldSubmitted(String value) {
    if (value.isEmpty && prevFocusNode != null) {
      prevFocusNode!.requestFocus();
    }
  }

  OutlineInputBorder borderDecoration() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.white,
        width: 2,
      ),
    );
  }

  OutlineInputBorder errBorderDecoration() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 2,
      ),
    );
  }
}
