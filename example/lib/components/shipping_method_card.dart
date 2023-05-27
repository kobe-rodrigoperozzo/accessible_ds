import 'package:accessible_ds/accessible_ds.dart';
import 'package:flutter/material.dart';

class ShippingMethodCard extends StatefulWidget {
  final String method;
  final double price;
  final bool isSelected;
  final int index;
  final Function(int) onSelect;

  const ShippingMethodCard(
      {required this.method, required this.price, required this.index, required this.isSelected, Key? key, required this.onSelect})
      : super(key: key);

  @override
  State<ShippingMethodCard> createState() => _ShippingMethodCardState();
}

class _ShippingMethodCardState extends State<ShippingMethodCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 16.0, 4.0, 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                DsIconButton(
                  iconSize: 36,
                  icon: widget.isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                  onPressed: () {
                    // Pass this back up to the parent widget
                    setState(() {
                      widget.onSelect(widget.index);
                    });
                  },
                  backgroundColor: Colors.transparent,
                  iconColor: Colors.blue,
                  alternativeText: widget.isSelected ? 'Shipping method selected' : 'Select this shipping method',
                ),
                const SizedBox(width: 16.0),
                Text(
                  widget.method,
                  style: DsTypography.body.copyWith(color: Colors.black),
                ),
              ],
            ),
            Text(
              '\$${widget.price.toStringAsFixed(2)}',
              style: DsTypography.body.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
