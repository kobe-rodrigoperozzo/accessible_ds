import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

class DsTypography extends Equatable {
  static const TextStyle title = TextStyle(
    fontSize: 36.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.25,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.25,
  );

  static const TextStyle highlight = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.25,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.25,
  );

  static const TextStyle normal = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.25,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.4,
  );

  @override
  List<Object?> get props => [
        title,
        subtitle,
        highlight,
        body,
        normal,
        caption,
      ];
}
