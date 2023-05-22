import 'package:accessible_ds/accessible_ds.dart';
import 'package:example/components/address.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  final Address address;

  const AddressCard({required this.address, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 4.0, 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: DsColors.primary,
                  size: 60.0,
                ),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${address.streetName}, ${address.number}',
                      style: DsTypography.body.copyWith(color: Colors.black),
                    ),
                    Text(
                      address.complement ?? '',
                      style: DsTypography.normal.copyWith(color: const Color(0xFF3A3B3C)),
                    ),
                    Text(
                      address.neighborhood,
                      style: DsTypography.normal.copyWith(color: const Color(0xFF3A3B3C)),
                    ),
                    Text(
                      '${address.city}, ${address.country}',
                      style: DsTypography.normal.copyWith(color: const Color(0xFF3A3B3C)),
                    ),
                    Text(
                      'Postal Code: ${address.postalCode}',
                      style: DsTypography.normal.copyWith(color: const Color(0xFF3A3B3C)),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 20.0,
            ),
            Row(
              children: [
                DsIconButton(
                  icon: Icons.edit,
                  onPressed: () {
                    debugPrint('Edit address');
                  },
                  backgroundColor: DsColors.primary,
                  iconColor: DsColors.onPrimary,
                  alternativeText: 'Edit address',
                  iconSize: 18, // adjust icon size here
                  padding: 0,
                ),
                DsIconButton(
                  icon: Icons.delete,
                  onPressed: () {
                    debugPrint('Delete address');
                  },
                  backgroundColor: DsColors.primary,
                  iconColor: DsColors.onPrimary,
                  alternativeText: 'Delete address',
                  iconSize: 18, // adjust icon size here
                  padding: 0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
