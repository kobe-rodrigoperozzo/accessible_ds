import 'package:accessible_ds/accessible_ds.dart';
import 'package:example/components/address.dart';
import 'package:example/components/address_card.dart';
import 'package:flutter/material.dart';

class ShippingPage extends StatefulWidget {
  final double totalPrice;

  const ShippingPage({required this.totalPrice, Key? key}) : super(key: key);

  @override
  _ShippingPageState createState() => _ShippingPageState();
}

class _ShippingPageState extends State<ShippingPage> {
  List<Address> addresses = [];

  void addAddress() {
    setState(() {
      addresses.add(
        Address(
          postalCode: '12345',
          streetName: 'Street Name',
          number: '123',
          complement: 'Apt 4B',
          neighborhood: 'Neighborhood',
          city: 'City',
          country: 'Country',
        ),
      );
    });
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
          : ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                return AddressCard(
                  address: addresses[index],
                );
              },
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
