import 'package:accessible_ds/accessible_ds.dart';
import 'package:example/components/address.dart';
import 'package:example/components/address_card.dart';
import 'package:example/components/shipping_method.dart';
import 'package:example/components/shipping_method_card.dart';
import 'package:flutter/material.dart';

import 'package:collection/collection.dart';

class ShippingPage extends StatefulWidget {
  final double totalPrice;

  const ShippingPage({required this.totalPrice, Key? key}) : super(key: key);

  @override
  _ShippingPageState createState() => _ShippingPageState();
}

class _ShippingPageState extends State<ShippingPage> {
  List<Address> addresses = [];
  int? selectedAddressIndex;

  List<ShippingMethod> shippingMethods = [
    ShippingMethod(method: 'Mais rápido', price: 12.50, eta: '1-2 dias'),
    ShippingMethod(method: 'Mais barato', price: 4.90, eta: '4-5 dias'),
  ];
  int? selectedShippingMethodIndex;

  double selectedShippingMethodPrice = 0.0;

  void addAddress() {
    showModalBottomSheet<Address>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return const AddressFormBottomSheet();
      },
    ).then((newAddress) {
      if (newAddress != null) {
        setState(() {
          addresses.add(newAddress);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DsColors.foundation,
      appBar: AppBar(
        backgroundColor: DsColors.primary,
        title: const Text('Entrega'),
      ),
      body: addresses.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Nenhum endereço cadastrado', style: DsTypography.body),
                  const SizedBox(
                    height: 8.0,
                  ),
                  DsTextButton(
                    onPressed: addAddress,
                    text: 'Adicionar endereço',
                    alternativeText: 'Adicionar endereço.',
                  ),
                ],
              ),
            )
          : ListView(
              children: [
                ...addresses
                    .mapIndexed((index, address) => AddressCard(
                          address: address,
                          index: index,
                          isSelected: selectedAddressIndex == index,
                          onSelect: (index) {
                            setState(() {
                              selectedAddressIndex = index;
                              selectedShippingMethodIndex = null;
                            });
                          },
                          onDelete: (index) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Center(child: Text('Remover endereço')),
                                    content: const Text('Deseja remover o endereço cadastrado?'),
                                    actions: <Widget>[
                                      Center(
                                        child: DsTextButton(
                                          text: 'Confirmar',
                                          onPressed: () {
                                            setState(() {
                                              addresses.removeAt(index);
                                              if (selectedAddressIndex == index) {
                                                selectedAddressIndex = null;
                                              }
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          alternativeText: 'Confirmar.',
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Center(
                                        child: DsTextButton(
                                          text: 'Cancelar',
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          alternativeText: 'Cancelar.',
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
                          },
                        ))
                    .toList(),
                const SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DsTextButton(
                    onPressed: addAddress,
                    text: 'Adicionar endereço',
                    alternativeText: 'Adicionar endereço.',
                  ),
                ),
                if (selectedAddressIndex != null) ...[
                  const SizedBox(
                    height: 8,
                  ),
                  ...shippingMethods.mapIndexed(
                    (index, method) => ShippingMethodCard(
                      eta: method.eta,
                      method: method.method,
                      price: method.price,
                      index: index,
                      isSelected: selectedShippingMethodIndex == index,
                      onSelect: (index) {
                        setState(() {
                          selectedShippingMethodIndex = index;
                          selectedShippingMethodPrice = method.price;
                        });
                      },
                    ),
                  ),
                ]
              ],
            ),
      bottomNavigationBar: BottomAppBar(
        color: DsColors.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: DsSpacing.regularPlus, vertical: DsSpacing.small),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DsTextButton(
                onPressed: (selectedAddressIndex != null && selectedShippingMethodIndex != null)
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          DsSnackBar(
                            text: 'Sucesso!',
                          ),
                        );
                      }
                    : () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          DsSnackBar(
                            text: 'Por favor, selecione um endereço e um método de entrega.',
                          ),
                        );
                      },
                text: 'Ir para o pagamento',
                alternativeText: 'Ir para o pagamento',
              ),
              Text(
                'R\$${(widget.totalPrice + selectedShippingMethodPrice).toStringAsFixed(2)}',
                style: DsTypography.highlight.copyWith(color: DsColors.onPrimary, fontSize: 20.0),
                semanticsLabel: '${(widget.totalPrice + selectedShippingMethodPrice).toStringAsFixed(2)} reais',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddressFormBottomSheet extends StatefulWidget {
  const AddressFormBottomSheet({Key? key}) : super(key: key);

  @override
  _AddressFormBottomSheetState createState() => _AddressFormBottomSheetState();
}

class _AddressFormBottomSheetState extends State<AddressFormBottomSheet> {
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController complementController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  bool isFormInvalid = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          DsSpacing.regular,
          DsSpacing.huge,
          DsSpacing.regular,
          MediaQuery.of(context).viewInsets.bottom + DsSpacing.bigger,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'Cadastrar um novo endereço',
                style: DsTypography.body.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Semantics(
              liveRegion: true,
              child: Visibility(
                visible: isFormInvalid,
                child: Center(
                  child: Text(
                    'Por favor, preencha todos os campos.',
                    style: DsTypography.body.copyWith(color: DsColors.error),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            DsInputTextField(
              controller: postalCodeController,
              label: 'CEP',
              alternativeText: 'Inserir o CEP.',
              keyboardType: const TextInputType.numberWithOptions(signed: true),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 12),
            const SizedBox(height: 4),
            DsInputTextField(
              controller: streetController,
              label: 'Rua',
              alternativeText: 'Inserir a rua.',
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      DsInputTextField(
                        controller: numberController,
                        label: 'Número',
                        alternativeText: 'Inserir o número.',
                        keyboardType: const TextInputType.numberWithOptions(signed: true),
                        textInputAction: TextInputAction.next,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      DsInputTextField(
                        controller: complementController,
                        label: 'Complemento',
                        alternativeText: 'Inserir o complemento.',
                        textInputAction: TextInputAction.next,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      DsInputTextField(
                        controller: neighborhoodController,
                        label: 'Bairro',
                        alternativeText: 'Inserir o bairro.',
                        textInputAction: TextInputAction.next,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      DsInputTextField(
                        controller: cityController,
                        label: 'Cidade',
                        alternativeText: 'Inserir a cidade.',
                        textInputAction: TextInputAction.done,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DsTextButton(
                  backgroundColor: DsColors.foundation,
                  textColor: Colors.black,
                  text: 'Fechar',
                  onPressed: () => Navigator.pop(context),
                  alternativeText: 'Fechar',
                ),
                DsTextButton(
                  text: 'Cadastrar',
                  onPressed: () {
                    if (postalCodeController.text.isNotEmpty &&
                        streetController.text.isNotEmpty &&
                        numberController.text.isNotEmpty &&
                        complementController.text.isNotEmpty &&
                        neighborhoodController.text.isNotEmpty &&
                        cityController.text.isNotEmpty) {
                      final newAddress = Address(
                        postalCode: postalCodeController.text,
                        streetName: streetController.text,
                        number: numberController.text,
                        complement: complementController.text,
                        neighborhood: neighborhoodController.text,
                        city: cityController.text,
                      );
                      Navigator.pop(context, newAddress);
                    } else {
                      setState(() {
                        isFormInvalid = true;
                      });
                    }
                  },
                  alternativeText: 'Cadastrar endereço.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
