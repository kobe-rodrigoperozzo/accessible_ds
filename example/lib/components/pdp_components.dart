import 'package:accessible_ds/accessible_ds.dart';
import 'package:flutter/material.dart';

class SizeVariations extends StatefulWidget {
  const SizeVariations({super.key});

  @override
  _SizeVariationsState createState() => _SizeVariationsState();
}

class _SizeVariationsState extends State<SizeVariations> {
  final List<String> sizes = ['SMALL', 'MEDIUM', 'LARGE'];
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: sizes.map((String size) {
        return DsTextButton(
          text: size,
          onPressed: () {
            setState(() {
              selectedSize = size;
            });
          },
          backgroundColor: selectedSize == size ? DsColors.primary : Colors.grey,
          alternativeText: 'size: $size',
        );
      }).toList(),
    );
  }
}

class ColorVariations extends StatefulWidget {
  const ColorVariations({super.key});

  @override
  _ColorVariationsState createState() => _ColorVariationsState();
}

class _ColorVariationsState extends State<ColorVariations> {
  final List<Color> colors = [Colors.red, Colors.blue, Colors.grey];
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: colors.map((Color color) {
        return DsIconButton(
          icon: Icons.circle,
          iconColor: color,
          backgroundColor: selectedColor == color ? color : DsColors.secondary,
          alternativeText: color.toString(),
          onPressed: () {
            setState(() {
              selectedColor = color;
            });
          },
        );
      }).toList(),
    );
  }
}
