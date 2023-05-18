import 'package:accessible_ds/accessible_ds.dart';
import 'package:example/components/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int quantity;

  ProductCard({required this.product, this.quantity = 1});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                DsImage(
                  imageUrl: product.imageUrl,
                  altText: 'Product Image',
                  width: 100,
                  height: 100,
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.title,
                      style: DsTypography.body.copyWith(color: Colors.black),
                    ),
                    Text(
                      product.id,
                      style: DsTypography.normal.copyWith(color: Colors.grey),
                    ),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: DsTypography.normal.copyWith(color: Colors.grey),
                    ),
                    Text(
                      'Quantity: $quantity',
                      style: DsTypography.normal.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            DsIconButton(
              icon: Icons.delete,
              onPressed: () {
                debugPrint('Remove item');
              },
              backgroundColor: DsColors.primary,
              iconColor: DsColors.onPrimary,
              alternativeText: 'Remove item',
            ),
          ],
        ),
      ),
    );
  }
}
