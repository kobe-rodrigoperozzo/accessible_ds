import 'package:accessible_ds/accessible_ds.dart';
import 'package:example/components/pdp_components.dart';
import 'package:example/components/product.dart';
import 'package:example/pages/cart.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({required this.product, Key? key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late List<Variation> _selectedVariations;

  @override
  void initState() {
    super.initState();
    _selectedVariations = widget.product.variations;
  }

  _checkVariations() {
    return _selectedVariations.every((variation) => variation.selectedVariation != null);
  }

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
                  imageUrl: widget.product.imageUrl,
                  altText: 'Product Image',
                  width: 300,
                  height: 300,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                widget.product.title,
                style: DsTypography.subtitle,
              ),
              Text(
                'Product Id: ${widget.product.id}',
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
                      widget.product.rating.round(),
                      (index) => const Icon(Icons.star, color: DsColors.primary),
                    ),
                  ),
                ],
              ),
              Text(
                'Sold by: ${widget.product.seller}',
                style: DsTypography.body.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 16.0),
              Text(
                widget.product.description,
                style: DsTypography.body,
              ),
              const SizedBox(height: 16.0),
              ..._selectedVariations.asMap().entries.map(
                    (entry) => VariationSelector(
                      variation: entry.value,
                      onChanged: (updatedVariation, selectedOption) {
                        setState(() {
                          _selectedVariations[entry.key] = updatedVariation;
                        });
                      },
                    ),
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
              if (_checkVariations()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  DsSnackBar(
                    duration: const Duration(seconds: 7),
                    text: 'Product added.',
                    actionLabel: 'Go to cart',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(
                            products: [
                              widget.product,
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  DsSnackBar(
                    text: 'Please, select all variations.',
                  ),
                );
              }
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
