import 'package:accessible_ds/accessible_ds.dart';
import 'package:example/components/product.dart';
import 'package:example/components/product_card.dart';
import 'package:example/pages/shipping.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Product> products;

  const CartPage({required this.products, Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void updateProductQuantity(Product product, int quantity) {
    setState(() {
      product.quantity.value = quantity;
    });
  }

  double discount = 0;
  final TextEditingController discountController = TextEditingController();

  double getTotalPrice() {
    return widget.products.fold(0.0, (total, product) => total + product.price * product.quantity.value);
  }

  double getTotalDiscount() {
    return widget.products.fold(0.0, (total, product) => total + (product.price - product.discountedPrice) * product.quantity.value) + discount;
  }

  void applyDiscount() {
    if (discountController.text.isNotEmpty) {
      setState(() {
        discount = getTotalPrice() * 0.2; // 20% discount
      });
    }
  }

  @override
  void dispose() {
    discountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DsColors.foundation,
      appBar: AppBar(
        backgroundColor: DsColors.primary,
        title: Text('Cart (${widget.products.length})'),
        actions: [
          DsIconButton(
            icon: Icons.remove_shopping_cart,
            onPressed: () {
              debugPrint('Clear cart');
            },
            backgroundColor: DsColors.primary,
            iconColor: DsColors.onPrimary,
            alternativeText: 'Clear cart',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ...widget.products
                  .map((product) => ProductCard(
                        product: product,
                        onQuantityChanged: (quantity) => updateProductQuantity(product, quantity),
                      ))
                  .toList(),
              const SizedBox(height: 16.0),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(height: 16.0),
              const Text('Discount Code', style: DsTypography.highlight),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: DsInputTextField(
                      label: 'Enter discount code',
                      controller: discountController,
                      alternativeText: 'Enter discount code',
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  DsIconButton(
                    icon: Icons.check,
                    alternativeText: 'Apply coupon',
                    onPressed: applyDiscount,
                    backgroundColor: DsColors.primary,
                    iconColor: DsColors.onPrimary,
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('Summary', style: DsTypography.highlight),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Subtotal',
                          style: DsTypography.body,
                        ),
                        Text(
                          '\$${getTotalPrice().toStringAsFixed(2)}',
                          style: DsTypography.body,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Discount',
                          style: DsTypography.body,
                        ),
                        Text(
                          '\$${getTotalDiscount().toStringAsFixed(2)}',
                          style: DsTypography.body,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Total', style: DsTypography.highlight),
                        Text('\$${(getTotalPrice() - getTotalDiscount()).toStringAsFixed(2)}', style: DsTypography.highlight),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShippingPage(
                    totalPrice: (getTotalPrice() - getTotalDiscount()),
                  ),
                ),
              );
            },
            text: 'Go to Checkout',
            backgroundColor: DsColors.primary,
            textColor: DsColors.onPrimary,
            alternativeText: 'Go to checkout',
          ),
        ),
      ),
    );
  }
}
