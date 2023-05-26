import 'package:flutter/material.dart';

class Product {
  final String title;
  final String id;
  final double price;
  final double discountedPrice;
  final String seller;
  final String imageUrl;
  final String description;
  final double rating;
  final List<Variation> variations;
  ValueNotifier<int> quantity;

  Product({
    required this.title,
    required this.id,
    required this.price,
    required this.seller,
    required this.imageUrl,
    required this.description,
    required this.rating,
    required this.variations,
    required this.discountedPrice,
    int initialQuantity = 1,
  }) : quantity = ValueNotifier<int>(initialQuantity);
}

class Variation {
  final String type;
  final List<String> options;
  String? selectedVariation;

  Variation({
    required this.type,
    required this.options,
    selectedVariation,
  });
}
