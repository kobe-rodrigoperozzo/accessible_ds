import 'package:accessible_ds/accessible_ds.dart';
import 'package:example/components/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  int quantity;
  final ValueChanged<int> onQuantityChanged;

  ProductCard({
    Key? key,
    required this.product,
    this.quantity = 1,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  void initState() {
    super.initState();
    widget.product.quantity.addListener(_updateQuantity);
  }

  @override
  void dispose() {
    widget.product.quantity.removeListener(_updateQuantity);
    super.dispose();
  }

  _updateQuantity() {
    setState(() {});
  }

  _editQuantity(BuildContext context) async {
    TextEditingController quantityController = TextEditingController(text: widget.product.quantity.value.toString());
    FocusNode focusNode = FocusNode();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Editar quantidade'),
            content: DsInputTextField(
              controller: quantityController,
              label: 'Quantidade',
              alternativeText: 'Inserir quantidade desejada.',
              keyboardType: TextInputType.number,
              inputTextStyle: DsTypography.body,
            ),
            actions: <Widget>[
              DsTextButton(
                text: 'Cancelar',
                onPressed: () {
                  Navigator.of(context).pop();
                },
                alternativeText: 'Cancelar',
                backgroundColor: Colors.transparent,
                textColor: DsColors.primary,
              ),
              DsTextButton(
                text: 'Confirmar',
                onPressed: () {
                  widget.product.quantity.value = int.parse(quantityController.text);
                  widget.onQuantityChanged(widget.product.quantity.value);
                  Navigator.of(context).pop();
                },
                alternativeText: 'Confirmar',
              ),
            ],
          );
        }).then((_) => focusNode.dispose());
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                ExcludeSemantics(
                  child: DsImage(
                    imageUrl: widget.product.imageUrl,
                    altText: 'Imagem: Tênis Modelo 5 Masculino',
                    width: 90,
                    height: 90,
                  ),
                ),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.product.title,
                      style: DsTypography.body.copyWith(color: Colors.black),
                    ),
                    // Text(
                    //   widget.product.id,
                    //   style: DsTypography.normal.copyWith(color: const Color(0xFF3A3B3C)),
                    // ),
                    Text(
                      'R\$${widget.product.price.toStringAsFixed(2)}',
                      style: DsTypography.normal.copyWith(color: const Color(0xFF3A3B3C)),
                      semanticsLabel: '${widget.product.price.toStringAsFixed(2)} reais',
                    ),
                    ...widget.product.variations.map((variation) {
                      return Text(
                        '${variation.type}: ${variation.selectedVariation}',
                        style: DsTypography.normal.copyWith(color: const Color(0xFF3A3B3C)),
                      );
                    }).toList(),
                    Text(
                      'Quantidade: ${widget.product.quantity.value}',
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
                    widget.product.quantity.value = 0;
                    widget.onQuantityChanged(widget.product.quantity.value);
                  },
                  backgroundColor: DsColors.primary,
                  iconColor: DsColors.onPrimary,
                  alternativeText: 'Remover item do carrinho.',
                ),
                const SizedBox(width: 2.0),
                DsIconButton(
                  icon: Icons.edit,
                  onPressed: () {
                    _editQuantity(context);
                  },
                  backgroundColor: DsColors.primary,
                  iconColor: DsColors.onPrimary,
                  alternativeText: 'Editar quantidade.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
