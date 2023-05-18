// ignore_for_file: library_private_types_in_public_api

import 'package:accessible_ds/accessible_ds.dart';
import 'package:example/components/product.dart';
import 'package:flutter/material.dart';

class VariationSelector extends StatefulWidget {
  final Variation variation;

  const VariationSelector({
    required this.variation,
    super.key,
  });

  @override
  _VariationSelectorState createState() => _VariationSelectorState();
}

class _VariationSelectorState extends State<VariationSelector> {
  String? selectedVariation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.variation.type,
          style: DsTypography.body,
        ),
        const SizedBox(
          height: 4.0,
        ),
        SizedBox(
          height: 48,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: widget.variation.options.map((String variation) {
              return Row(
                children: [
                  DsTextButton(
                    text: variation,
                    onPressed: () {
                      setState(() {
                        selectedVariation = variation;
                        widget.variation.selectedVariation = variation;
                      });
                    },
                    backgroundColor: selectedVariation == variation ? DsColors.primary : Colors.grey,
                    alternativeText: '${widget.variation.type}: $variation',
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
      ],
    );
  }
}
