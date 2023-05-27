import 'package:accessible_ds/accessible_ds.dart';
import 'package:example/components/address.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatefulWidget {
  final Address address;
  final bool isSelected;
  final int index;
  final Function(int) onSelect;
  final Function(int) onDelete;

  const AddressCard({
    required this.address,
    required this.index,
    required this.isSelected,
    Key? key,
    required this.onSelect,
    required this.onDelete,
  }) : super(key: key);

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
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
                  iconSize: 50,
                  icon: widget.isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                  onPressed: () {
                    // Pass this back up to the parent widget
                    setState(() {
                      widget.onSelect(widget.index);
                    });
                  },
                  backgroundColor: Colors.transparent,
                  iconColor: Colors.blue,
                  alternativeText: widget.isSelected ? 'Endereço selecionado.' : 'Selecionar endereço.',
                ),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${widget.address.streetName}, ${widget.address.number}',
                      style: DsTypography.body.copyWith(color: Colors.black),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.address.complement ?? '',
                          style: DsTypography.normal.copyWith(color: const Color(0xFF3A3B3C)),
                        ),
                        Text(
                          widget.address.neighborhood,
                          style: DsTypography.normal.copyWith(color: const Color(0xFF3A3B3C)),
                        ),
                        Text(
                          widget.address.city,
                          style: DsTypography.normal.copyWith(color: const Color(0xFF3A3B3C)),
                        ),
                        Text(
                          widget.address.postalCode,
                          style: DsTypography.normal.copyWith(color: const Color(0xFF3A3B3C)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                DsIconButton(
                  icon: Icons.edit,
                  onPressed: () {
                    debugPrint('Edit address');
                  },
                  backgroundColor: DsColors.primary,
                  iconColor: DsColors.onPrimary,
                  alternativeText: 'Editar endereço.',
                  iconSize: 18, // adjust icon size here
                  padding: 0,
                ),
                DsIconButton(
                  icon: Icons.delete,
                  onPressed: () {
                    widget.onDelete(widget.index);
                  },
                  backgroundColor: DsColors.primary,
                  iconColor: DsColors.onPrimary,
                  alternativeText: 'Deletar endereço.',
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
