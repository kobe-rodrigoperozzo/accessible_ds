import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

class DsColors extends Equatable {
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color foundation;
  final Color background;
  final Color error;

  const DsColors({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.foundation,
    required this.background,
    required this.error,
  });

  factory DsColors.standard() => const DsColors(
        primary: Color(0xFF5F78F0),
        onPrimary: Color(0xFFFFFFFF),
        secondary: Color(0xFF363148),
        onSecondary: Color(0xFF272C9A),
        foundation: Color(0xFFEBECED),
        background: Color(0xFFD7DDE3),
        error: Colors.red,
      );

  // factory DsColors.dark() => const DsColors(
  //       primary: Color(0xFF454CFF),
  //       onPrimary: Color(0xFFFFFFFF),
  //       secondary: Color(0xFF2D33B9),
  //       onSecondary: Color(0xFF272C9A),
  //       foundation: Color(0xFF000000),
  //       background: Color(0xFFFFFFFF),
  //     );

  // factory DsColors.highContrast() => const DsColors(
  //       primary: Color(0xFF454CFF),
  //       onPrimary: Color(0xFFFFFFFF),
  //       secondary: Color(0xFF2D33B9),
  //       onSecondary: Color(0xFF272C9A),
  //       foundation: Color(0xFF000000),
  //       background: Color(0xFFFFFFFF),
  //     );

  @override
  List<Object?> get props => [
        primary,
        onPrimary,
        secondary,
        onSecondary,
        foundation,
        background,
        error,
      ];
}
