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
              Navigator.push(
                context,
                MaterialPageRoute(
                  // TODO: add another product
                  builder: (context) => CartPage(
                    products: [],
                  ),
                ),
              );
            },
            backgroundColor: DsColors.primary,
            iconColor: DsColors.onPrimary,
            alternativeText: 'Ir para o carrinho.',
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
                  altText: 'Imagem: Tênis Modelo 5 Masculino',
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
                'ID do produto: ${widget.product.id}',
                style: DsTypography.body,
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'R\$${widget.product.price.toStringAsFixed(2)}',
                    style: DsTypography.title.copyWith(color: DsColors.primary),
                    semanticsLabel: '${widget.product.price.toStringAsFixed(2)} reais',
                  ),
                  Semantics(
                    label: '${widget.product.rating} estrelas',
                    child: Row(
                      children: List.generate(
                        widget.product.rating.round(),
                        (index) => const Icon(Icons.star, color: DsColors.primary),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Vendido por ${widget.product.seller}',
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
                // ScaffoldMessenger.of(context).showSnackBar(
                //   DsSnackBar(
                //     duration: const Duration(seconds: 7),
                //     text: 'Produto ${widget.product.title} adicionado ao carrinho. Clique no botão ao lado para ser redirecionado.',
                //     actionLabel: 'Carrinho',
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => CartPage(
                //             products: [
                //               getSelectedProductWithVariations(),
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // );
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Center(child: Text('Sucesso!')),
                        content: const Text('Produto adicionado com sucesso ao carrinho.'),
                        actions: <Widget>[
                          Center(
                            child: DsTextButton(
                              text: 'Ir para o carrinho',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CartPage(
                                      products: [
                                        getSelectedProductWithVariations(),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              alternativeText: 'Ir para o carrinho.',
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Center(
                            child: DsTextButton(
                              text: 'Permanecer no produto',
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              alternativeText: 'Permanecer no produto.',
                              backgroundColor: Colors.transparent,
                              textColor: DsColors.primary,
                            ),
                          ),
                          const SizedBox(
                            height: 28.0,
                          )
                        ],
                      );
                    });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  DsSnackBar(
                    text: 'Por favor, selecione todas as variações.',
                  ),
                );
              }
            },
            text: 'Adicionar ao carrinho.',
            backgroundColor: DsColors.primary,
            textColor: DsColors.onPrimary,
            alternativeText: 'Adicionar ao carrinho.',
          ),
        ),
      ),
    );
  }

  Product getSelectedProductWithVariations() {
    return Product(
      id: widget.product.id,
      title: widget.product.title,
      imageUrl: widget.product.imageUrl,
      price: widget.product.price,
      rating: widget.product.rating,
      seller: widget.product.seller,
      description: widget.product.description,
      variations: _selectedVariations,
      discountedPrice: widget.product.price,
    );
  }
}
