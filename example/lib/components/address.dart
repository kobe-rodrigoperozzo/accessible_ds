class Address {
  final String postalCode;
  final String streetName;
  final String number;
  final String neighborhood;
  final String city;
  final String? country;
  final String? complement;

  Address({
    required this.postalCode,
    required this.streetName,
    required this.number,
    required this.neighborhood,
    required this.city,
    this.country,
    this.complement,
  });
}
