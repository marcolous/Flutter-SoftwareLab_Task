import 'package:flutter/material.dart';
import 'package:software_lab/feature/auth/presentation/view/verify_otp/widgets/verification_text_field.dart';

class VerifyOtpInputRow extends StatefulWidget {
  const VerifyOtpInputRow({
    super.key,
    required this.onFieldsChanged,
    required this.onOtpChanged,
  });

  final void Function(bool allFieldsFilled) onFieldsChanged;
  final void Function(String otp) onOtpChanged;

  @override
  State<VerifyOtpInputRow> createState() => _VerificationInputRowState();
}

class _VerificationInputRowState extends State<VerifyOtpInputRow> {
  final TextEditingController _firstNum = TextEditingController();
  final TextEditingController _secondNum = TextEditingController();
  final TextEditingController _thirdNum = TextEditingController();
  final TextEditingController _forthNum = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  final FocusNode _firstFocus = FocusNode();
  final FocusNode _secondFocus = FocusNode();
  final FocusNode _thirdFocus = FocusNode();
  final FocusNode _forthFocus = FocusNode();

  String get otp {
    return _firstNum.text + _secondNum.text + _thirdNum.text + _forthNum.text;
  }

  void _checkFields() {
    final allFieldsFilled = _firstNum.text.isNotEmpty &&
        _secondNum.text.isNotEmpty &&
        _thirdNum.text.isNotEmpty &&
        _forthNum.text.isNotEmpty;
    widget.onFieldsChanged(allFieldsFilled);
    widget.onOtpChanged(otp);
  }

  @override
  void initState() {
    _firstNum.addListener(_checkFields);
    _secondNum.addListener(_checkFields);
    _thirdNum.addListener(_checkFields);
    _forthNum.addListener(_checkFields);
    super.initState();
  }

  @override
  void dispose() {
    _firstNum.dispose();
    _secondNum.dispose();
    _thirdNum.dispose();
    _forthNum.dispose();

    _firstFocus.dispose();
    _secondFocus.dispose();
    _thirdFocus.dispose();
    _forthFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          VerificationTextField(
            controller: _firstNum,
            focusNode: _firstFocus,
            nextFocusNode: _secondFocus,
          ),
          VerificationTextField(
            controller: _secondNum,
            focusNode: _secondFocus,
            prevFocusNode: _firstFocus,
            nextFocusNode: _thirdFocus,
          ),
          VerificationTextField(
            controller: _thirdNum,
            focusNode: _thirdFocus,
            prevFocusNode: _secondFocus,
            nextFocusNode: _forthFocus,
          ),
          VerificationTextField(
            controller: _forthNum,
            focusNode: _forthFocus,
            prevFocusNode: _thirdFocus,
          ),
        ],
      ),
    );
  }
}
