import 'package:accessible_ds/accessible_ds.dart';
import 'package:example/components/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  int quantity;

  ProductCard({Key? key, required this.product, this.quantity = 1}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  _editQuantity(BuildContext context) async {
    TextEditingController quantityController = TextEditingController(text: widget.quantity.toString());
    FocusNode focusNode = FocusNode();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Edit Quantity'),
            content: DsInputTextField(
              controller: quantityController,
              label: 'Quantity',
              alternativeText: 'Edit quantity',
              keyboardType: TextInputType.number,
              inputTextStyle: DsTypography.body,
            ),
            actions: <Widget>[
              DsTextButton(
                text: 'Cancel',
                onPressed: () {
                  Navigator.of(context).pop();
                },
                alternativeText: 'Cancel edit',
                backgroundColor: DsColors.primary,
                textColor: DsColors.primary,
              ),
              DsTextButton(
                text: 'OK',
                onPressed: () {
                  setState(() {
                    widget.quantity = int.parse(quantityController.text);
                  });
                  Navigator.of(context).pop();
                },
                alternativeText: 'Confirm edit',
              ),
            ],
          );
        }).then((_) => focusNode.dispose());
  }

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
                  imageUrl: widget.product.imageUrl,
                  altText: 'Product Image',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.product.title,
                      style: DsTypography.body.copyWith(color: Colors.black),
                    ),
                    Text(
                      widget.product.id,
                      style: DsTypography.normal.copyWith(color: const Color(0xFF3A3B3C)),
                    ),
                    Text(
                      '\$${widget.product.price.toStringAsFixed(2)}',
                      style: DsTypography.normal.copyWith(color: const Color(0xFF3A3B3C)),
                    ),
                    ...widget.product.variations.map((variation) {
                      return Text(
                        '${variation.type}: ${variation.selectedVariation}',
                        style: DsTypography.normal.copyWith(color: const Color(0xFF3A3B3C)),
                      );
                    }).toList(),
                    Text(
                      'Quantity: ${widget.quantity}',
                      style: DsTypography.normal.copyWith(color: const Color(0xFF3A3B3C)),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                DsIconButton(
                  icon: Icons.delete,
                  onPressed: () {
                    debugPrint('Remove item');
                  },
                  backgroundColor: DsColors.primary,
                  iconColor: DsColors.onPrimary,
                  alternativeText: 'Remove item',
                ),
                const SizedBox(width: 5.0),
                DsIconButton(
                  icon: Icons.edit,
                  onPressed: () {
                    _editQuantity(context);
                  },
                  backgroundColor: DsColors.primary,
                  iconColor: DsColors.onPrimary,
                  alternativeText: 'Edit quantity',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
