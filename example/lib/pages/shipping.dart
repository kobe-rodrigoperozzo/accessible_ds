import 'package:accessible_ds/accessible_ds.dart';
import 'package:example/components/address.dart';
import 'package:example/components/address_card.dart';
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
  int selectedAddressIndex = -1;

  void addAddress() {
    TextEditingController postalCodeController = TextEditingController();
    TextEditingController streetController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController complementController = TextEditingController();
    TextEditingController neighborhoodController = TextEditingController();
    TextEditingController cityController = TextEditingController();

    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
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
                const SizedBox(height: 4),
                DsInputTextField(
                  controller: postalCodeController,
                  label: 'Postal Code',
                  alternativeText: 'Postal Code',
                  keyboardType: const TextInputType.numberWithOptions(signed: true),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 12),
                const SizedBox(height: 4),
                DsInputTextField(
                  controller: streetController,
                  label: 'Street',
                  alternativeText: 'Street',
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
                            label: 'Number',
                            alternativeText: 'Number',
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
                            label: 'Complement',
                            alternativeText: 'Complement',
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
                            label: 'Neighborhood',
                            alternativeText: 'Neighborhood',
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
                            label: 'City',
                            alternativeText: 'City',
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
                      text: 'Close',
                      onPressed: () => Navigator.pop(context),
                      alternativeText: 'Close',
                    ),
                    DsTextButton(
                      text: 'Register',
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
                          setState(() {
                            addresses.add(newAddress);
                          });
                          // Register address logic
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            DsSnackBar(
                              duration: const Duration(seconds: 3),
                              text: 'Por favor, preencha todos os campos de endereço.',
                            ),
                          );
                        }
                      },
                      alternativeText: 'Register',
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DsColors.foundation,
      appBar: AppBar(
        backgroundColor: DsColors.primary,
        title: const Text('Shipping'),
      ),
      body: addresses.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No Addresses', style: DsTypography.body),
                  const SizedBox(
                    height: 8.0,
                  ),
                  DsTextButton(
                    onPressed: addAddress,
                    text: 'Add an address',
                    alternativeText: 'Add an address',
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
                    text: 'Add an address',
                    alternativeText: 'Add an address',
                  ),
                ),
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
                onPressed: () {
                  debugPrint('Proceed to payments');
                },
                text: 'Proceed to payments',
                alternativeText: 'Proceed to payments',
              ),
              Text(
                '\$${widget.totalPrice.toStringAsFixed(2)}',
                style: DsTypography.highlight.copyWith(color: DsColors.onPrimary, fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
