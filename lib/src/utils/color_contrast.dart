import 'dart:math';

import 'package:flutter/material.dart';

// Calculate the contrast ratio between the two colors.
// The contrast ratio is the ratio between the luminance of the lighter color and the darker color.
// Source: https://www.w3.org/TR/WCAG20/#contrast-ratiodef
double calculateContrastRatio(Color color1, Color color2) {
  double l1 = calculateRelativeLuminance(color1);
  double l2 = calculateRelativeLuminance(color2);

  // Adding 0.05 to the relative luminance values in the ratio ensures that the ratio is well-defined
  // even for black and white colors (with relative luminance values of 0 and 1, respectively).
  if (l1 > l2) {
    return (l1 + 0.05) / (l2 + 0.05);
  } else {
    return (l2 + 0.05) / (l1 + 0.05);
  }
}

// Calculate the relative luminance using the WCAG formula.
// The formula is a weighted sum of the normalized color components,
// reflecting the human eye's sensitivity to different colors.
// The weights (0.2126, 0.7152, and 0.0722) are based on the ITU-R Recommendation BT.709.
// Source: https://www.w3.org/TR/WCAG20/#relativeluminancedef
double calculateRelativeLuminance(Color color) {
  // Normalize the color component values (red, green, blue) to the range [0, 1]
  // This is done by dividing the component value by 255 (the maximum value of an 8-bit color component)
  double r = color.red / 255.0;
  double g = color.green / 255.0;
  double b = color.blue / 255.0;

  // The WCAG guidelines recommend applying a specific transformation to each color component
  // before calculating the relative luminance.
  // This transformation accounts for the nonlinear relationship between the physical intensity
  // of a color component and the perceived intensity by the human eye.
  r = r <= 0.03928 ? r / 12.92 : pow((r + 0.055) / 1.055, 2.4).toDouble();
  g = g <= 0.03928 ? g / 12.92 : pow((g + 0.055) / 1.055, 2.4).toDouble();
  b = b <= 0.03928 ? b / 12.92 : pow((b + 0.055) / 1.055, 2.4).toDouble();

  return 0.2126 * r + 0.7152 * g + 0.0722 * b;
}

Color adjustTextColorForContrast(Color textColor, Color backgroundColor, {double minContrastRatio = 4.5}) {
  double contrastRatio = calculateContrastRatio(textColor, backgroundColor);
  HSLColor hslTextColor = HSLColor.fromColor(textColor);
  HSLColor hslBackgroundColor = HSLColor.fromColor(backgroundColor);

  // If the contrast ratio is already sufficient, return the original text color
  if (contrastRatio >= minContrastRatio) {
    return textColor;
  }

  // Determine whether to lighten or darken the text color based on the background color lightness
  bool shouldLighten = hslBackgroundColor.lightness < 0.5;

  // Incrementally adjust the lightness of the text color until the contrast ratio is sufficient
  while (contrastRatio < minContrastRatio) {
    double newLightness = shouldLighten ? hslTextColor.lightness + 0.05 : hslTextColor.lightness - 0.05;

    if (newLightness < 0 || newLightness > 1) {
      // If the lightness goes out of range (0-1), the color cannot be adjusted further
      break;
    }
    hslTextColor = hslTextColor.withLightness(newLightness);
    contrastRatio = calculateContrastRatio(hslTextColor.toColor(), backgroundColor);
  }

  return hslTextColor.toColor();
}
