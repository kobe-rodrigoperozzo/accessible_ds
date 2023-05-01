import 'package:flutter/material.dart';

import 'package:accessible_ds/accessible_ds.dart';
import 'package:accessible_ds/src/utils/color_contrast.dart';

class DsIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String alternativeText;
  final double padding;
  final Color iconColor;
  final double iconSize;
  final Color backgroundColor;
  final Color borderColor;

  const DsIconButton({
    Key? key,
    required this.icon,
    required this.alternativeText,
    required this.onPressed,
    this.iconColor = DsColors.primary,
    this.backgroundColor = DsColors.onPrimary,
    this.borderColor = Colors.grey,
    this.iconSize = 24.0,
    this.padding = DsSpacing.small,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: alternativeText,
      button: true,
      child: MaterialButton(
        child: Icon(
          icon,
          size: iconSize,
          color: adjustColorForContrast(iconColor, backgroundColor),
        ),
        onPressed: onPressed,
        color: backgroundColor,
        padding: EdgeInsets.all(padding),
        shape: CircleBorder(
          side: BorderSide(
            color: borderColor,
          ),
        ),
      ),
    );
  }
}
