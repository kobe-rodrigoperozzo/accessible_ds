import 'package:equatable/equatable.dart';

class DsSpacing extends Equatable {
  const DsSpacing._();
  static const base = 4.0;

  static const double smaller = 1 * base;
  static const double small = 2 * base;
  static const double regular = 3 * base;
  static const double regularPlus = 4 * base;
  static const double big = 5 * base;
  static const double bigger = 6 * base;
  static const double huge = 8 * base;

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
