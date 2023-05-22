import 'package:accessible_ds/accessible_ds.dart';
import 'package:example/components/pdp_components.dart';
import 'package:example/components/product.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DsColors.foundation,
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
              Center(
                child: DsImage(
                  imageUrl: product.imageUrl,
                  altText: 'Product Image',
                  width: 300,
                  height: 300,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                product.title,
                style: DsTypography.subtitle,
              ),
              Text(
                'Product Id: ${product.id}',
                style: DsTypography.body,
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '\$50.00', // Assume price as hardcoded for now
                    style: DsTypography.title.copyWith(color: DsColors.primary),
                  ),
                  Row(
                    children: List.generate(
                      product.rating.round(),
                      (index) => const Icon(Icons.star, color: DsColors.primary),
                    ),
                  ),
                ],
              ),
              Text(
                'Sold by: ${product.seller}',
                style: DsTypography.body.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 16.0),
              Text(
                product.description,
                style: DsTypography.body,
              ),
              const SizedBox(height: 16.0),
              const Text('Variations:', style: DsTypography.body),
              const SizedBox(height: 16.0),
              ...product.variations.map(
                (e) => VariationSelector(variation: e),
              ),
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
