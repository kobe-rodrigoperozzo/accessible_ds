import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

class DsColors extends Equatable {
  const DsColors._();

  static const Color primary = Color(0xFF5F78F0);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFF363148);
  static const Color onSecondary = Color(0xFF272C9A);
  static const Color foundation = Color(0xFFEBECED);
  static const Color background = Color(0xFFD7DDE3);
  static const Color error = Colors.red;
  static const Color transparent = Colors.transparent;

  @override
  List<Object?> get props => [
        primary,
        onPrimary,
        secondary,
        onSecondary,
        foundation,
        background,
        error,
        transparent,
      ];
}
