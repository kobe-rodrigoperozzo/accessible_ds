import 'package:flutter/material.dart';

import 'package:accessible_ds/src/utils/color_contrast.dart';
import 'package:accessible_ds/accessible_ds.dart';

class DsTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String alternativeText;
  final Color textColor;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final TextStyle textStyle;

  const DsTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.alternativeText,
    this.textColor = DsColors.onPrimary,
    this.backgroundColor = DsColors.primary,
    this.borderRadius = DsBorderRadius.small,
    this.textStyle = DsTypography.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Botão: $alternativeText',
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          textStyle: textStyle,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: adjustColorForContrast(textColor, backgroundColor),
          ),
        ),
      ),
    );
  }
}
