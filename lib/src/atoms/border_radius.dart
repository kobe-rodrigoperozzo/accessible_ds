import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

class DsBorderRadius extends Equatable {
  const DsBorderRadius._();

  static const BorderRadius small = BorderRadius.all(Radius.circular(4.0));
  static const BorderRadius medium = BorderRadius.all(Radius.circular(8.0));
  static const BorderRadius large = BorderRadius.all(Radius.circular(16.0));
  static const BorderRadius extraLarge = BorderRadius.all(Radius.circular(24.0));

  // Circle
  static const BorderRadius circle = BorderRadius.all(Radius.circular(50.0));

  @override
  List<Object?> get props => [
        small,
        medium,
        large,
        extraLarge,
        circle,
      ];
}
