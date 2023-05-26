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
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 32.0,
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
                const Text('Postal Code', style: DsTypography.body),
                const SizedBox(height: 4),
                DsInputTextField(
                  controller: postalCodeController,
                  label: 'Postal Code',
                  alternativeText: 'Postal Code',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),
                const Text('Street', style: DsTypography.body),
                const SizedBox(height: 4),
                DsInputTextField(
                  controller: streetController,
                  label: 'Street',
                  alternativeText: 'Street',
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Number', style: DsTypography.body),
                          const SizedBox(height: 4),
                          DsInputTextField(
                            controller: numberController,
                            label: 'Number',
                            alternativeText: 'Number',
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Complement', style: DsTypography.body),
                          const SizedBox(height: 4),
                          DsInputTextField(
                            controller: complementController,
                            label: 'Complement',
                            alternativeText: 'Complement',
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
                          const Text('Neighborhood', style: DsTypography.body),
                          const SizedBox(height: 4),
                          DsInputTextField(
                            controller: neighborhoodController,
                            label: 'Neighborhood',
                            alternativeText: 'Neighborhood',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('City', style: DsTypography.body),
                          const SizedBox(height: 4),
                          DsInputTextField(
                            controller: cityController,
                            label: 'City',
                            alternativeText: 'City',
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
                      text: 'Close',
                      onPressed: () => Navigator.pop(context),
                      alternativeText: 'Close',
                    ),
                    DsTextButton(
                      text: 'Register',
                      onPressed: () {
                        // Register address logic
                        Navigator.pop(context);
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
