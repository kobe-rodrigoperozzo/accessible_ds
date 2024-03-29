import 'package:accessible_ds/accessible_ds.dart';
import 'package:flutter/material.dart';

class DsInputTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String alternativeText;
  final String? helperText;
  final TextInputType keyboardType;
  final TextStyle inputTextStyle;
  final TextInputAction textInputAction;

  const DsInputTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.alternativeText,
    this.helperText,
    this.keyboardType = TextInputType.text,
    this.inputTextStyle = DsTypography.body,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      textField: true,
      label: alternativeText,
      child: TextField(
        style: inputTextStyle,
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
            labelText: label,
            helperText: helperText,
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: DsColors.primary,
                width: 1.0,
              ),
            )),
      ),
    );
  }
}
