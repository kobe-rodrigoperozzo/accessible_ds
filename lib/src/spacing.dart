import 'package:equatable/equatable.dart';

class DsSpacing extends Equatable {
  const DsSpacing._();

  static const double rlySmall = 4.0;
  static const double small = 8.0;
  static const double regular = 12.0;
  static const double regularPlus = 16.0;
  static const double big = 20.0;
  static const double rlyBig = 24.0;
  static const double huge = 32.0;

  @override
  List<Object?> get props => [
        rlySmall,
        small,
        regular,
        regularPlus,
        big,
        rlyBig,
        huge,
      ];
}
