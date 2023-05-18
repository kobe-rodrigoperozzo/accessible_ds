import 'package:accessible_ds/accessible_ds.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  final String productName;
  final double productPrice;
  final int productQuantity;

  const CartProductCard({
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.image), // You can replace this with actual product image
      title: Text(productName),
      subtitle: Text('Price: \$${productPrice.toStringAsFixed(2)}'),
      trailing: Text('Quantity: $productQuantity'),
    );
  }
}

class ShippingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Shipping simulation', style: DsTypography.body),
        // Your shipping simulation logic goes here
      ],
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartData = [
    {'name': 'Product 1', 'price': 50.0, 'quantity': 1},
    {'name': 'Product 2', 'price': 100.0, 'quantity': 2},
  ];

  double get totalPrice {
    double total = 0;
    for (var product in cartData) {
      total += product['price'] * product['quantity'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart', style: DsTypography.title.copyWith(color: DsColors.onPrimary)),
        backgroundColor: DsColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DsSpacing.regular),
          child: Column(
            children: <Widget>[
              ...cartData
                  .map((product) => CartProductCard(
                        productName: product['name'],
                        productPrice: product['price'],
                        productQuantity: product['quantity'],
                      ))
                  .toList(),
              ShippingWidget(),
              Text(
                'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                style: DsTypography.title.copyWith(color: DsColors.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
