// ignore_for_file: library_private_types_in_public_api

import 'package:accessible_ds/accessible_ds.dart';
import 'package:example/components/pdp_components.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DsColors.primary,
        actions: [
          DsIconButton(
            icon: Icons.shopping_cart,
            onPressed: () {
              debugPrint('Go to cart');
            },
            backgroundColor: DsColors.primary,
            iconColor: DsColors.onPrimary,
            alternativeText: 'Go to cart',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: DsImage(
                  imageUrl: "https://imgnike-a.akamaihd.net/768x768/02569651.jpg",
                  altText: 'Product Image',
                  width: 300,
                  height: 300,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Product Title',
                style: DsTypography.subtitle,
              ),
              const Text(
                'Product Id: 12345',
                style: DsTypography.body,
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '\$50.00',
                    style: DsTypography.title.copyWith(color: DsColors.primary),
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) => const Icon(Icons.star, color: DsColors.primary),
                    ),
                  ),
                ],
              ),
              Text(
                'Sold by: seller',
                style: DsTypography.body.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Product Description',
                style: DsTypography.body,
              ),
              const SizedBox(height: 16.0),
              const Text('Size:', style: DsTypography.body),
              const SizedBox(height: 4.0),
              const SizeVariations(),
              const SizedBox(height: 16.0),
              const Text('Color:', style: DsTypography.body),
              const SizedBox(height: 4.0),
              const ColorVariations(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: DsColors.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: DsSpacing.regularPlus, vertical: DsSpacing.small),
          child: DsTextButton(
            onPressed: () {
              debugPrint('Add to cart');
            },
            text: 'Add to Cart',
            backgroundColor: DsColors.primary,
            textColor: DsColors.onPrimary,
            alternativeText: 'Add to cart',
          ),
        ),
      ),
    );
  }
}
