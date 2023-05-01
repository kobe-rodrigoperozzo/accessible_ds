import 'package:equatable/equatable.dart';

class DsSpacing extends Equatable {
  const DsSpacing._();
  static const _base = 4.0;

  static const double smaller = 1 * _base;
  static const double small = 2 * _base;
  static const double regular = 3 * _base;
  static const double regularPlus = 4 * _base;
  static const double big = 5 * _base;
  static const double bigger = 6 * _base;
  static const double huge = 8 * _base;

  @override
  List<Object?> get props => [
        smaller,
        small,
        regular,
        regularPlus,
        big,
        bigger,
        huge,
      ];
}
